from model import common
import torch.nn as nn

def make_model(args, parent=False):
    return SRCNN_BASIC(args)


class SRCNN_BASIC(nn.Module):
    def __init__(self, args, conv=common.default_conv):
        super(SRCNN_BASIC, self).__init__()

        n_resblocks = args.n_resblocks
        n_feats = args.n_feats
        kernel_size = 3
        scale = args.scale[0]
        act = nn.ReLU()

        def basic_block(in_channels, out_channels, act):
            return common.BasicBlock(
                conv, in_channels, out_channels, kernel_size,
                bias=False, bn=False, act=act # bn = True for batch normalization
            )

        # define head module
        m_head = [conv(args.n_colors, n_feats, kernel_size)]

        #define body module
        m_body = []
        m_body.append(basic_block(n_feats, n_feats, act))
        for _ in range(n_resblocks - 2):
            m_body.append(basic_block(n_feats, n_feats, act))

        # define tail module
        m_tail = [
            common.Upsampler(conv, scale, n_feats, act=False),
            conv(n_feats, args.n_colors, kernel_size)
        ]


        self.head = nn.Sequential(*m_head)
        self.body = nn.Sequential(*m_body)
        self.tail = nn.Sequential(*m_tail)


    def forward(self, x):
        x = self.head(x)

        res = self.body(x)
        res += x

        x = self.tail(res)

        return x
