Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l097A-0002uR-I8
	for mharc-qemu-riscv@gnu.org; Thu, 14 Jan 2021 15:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0972-0002sf-Nd; Thu, 14 Jan 2021 15:20:57 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:43301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l096y-0005Wr-J2; Thu, 14 Jan 2021 15:20:56 -0500
Received: by mail-io1-xd29.google.com with SMTP id o6so13753288iob.10;
 Thu, 14 Jan 2021 12:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=65elaR6R44yEYGFJF/f5BDLhTIq5rvG56ri3HjtBwNA=;
 b=EvnPcpOm0xxeHok8Y1resICIyJLWAdHLwXZOkhmBAFBcZolLPCz68ZZI9H7vJgk8LR
 +Wq1dbaazbuiKzQpu/1ycodyPLzpHpArgxHJbwIN8SIqUv31z3sBd7jRQqEUPQ77ikmJ
 CAD2qaGEPgTiKfRbPusTX2W4C9gVF4oyEHAOsGPgbp44UTELPaHXWLwO2WX3WnrxvSop
 SGV8rEC3i8BKoSCE6zCGUYgYXdQjjC9XOyRvTejQsXGf4BA+lpDgcNp/fLoxKmZhojQY
 wUjKMoPpmMHwW/HygKnev+AYdzjIysGdKD+p9cYEiozZHb0hx5JpXYHUaSAz64RIalP9
 Nuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=65elaR6R44yEYGFJF/f5BDLhTIq5rvG56ri3HjtBwNA=;
 b=crYupV06U0vZvsqLB7BtCyFqOV+9IG48lE3zvW2guBF8fggiKa/nuB78rHGi8/Krpf
 2qlJUIvy/HTcUqMyHLX2vgln+9s6A0hZc3mGAjs7ZHzchGycfLeAAEWly0iKIEWs3a15
 tRI0cIuDEIS+UwwrjTaVX0nX9AtC3IcsG2LT8yH3Unsf0nUen/0C9+DSbWTlTmBJ4UNE
 QFzrDuFRAcZjY1L7jnubNgkD35sTZw/+UAS5VbBtNOb4eNFe6RPZXD3dqV0ll9q337jM
 nyP0Yn1frmZAOzkRcKBf/rOZOTTCP/MRWdcWYFANI6xTYr/sUNgsem4Z15tSvjFjWdPF
 gp3Q==
X-Gm-Message-State: AOAM533g4H/Vah4oa3NDzcBYmEVw8Oa0pP5rrI57BbukS5nQi7ZQzUN5
 Sn80fIBiGNY4v4uRuLlSkBqAUvy6vm1Erpy2YbM=
X-Google-Smtp-Source: ABdhPJyqlS6ESer27Pt3UIkktEaj6n/vLh/CCwWWr6O04IOxsmdoSw0IJBUQLlNd7TsNz9bDXF5sN72TKK5FFhQEKhk=
X-Received: by 2002:a92:cb44:: with SMTP id f4mr8003757ilq.131.1610655648961; 
 Thu, 14 Jan 2021 12:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-7-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-7-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 14 Jan 2021 12:20:22 -0800
Message-ID: <CAKmqyKOQ_==uQKRGyAHv6PMiV0VH34K2zbK=PkML0VYjqsojeQ@mail.gmail.com>
Subject: Re: [PATCH 06/22] util: Add CRC16 (CCITT) calculation routines
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jan 2021 20:20:58 -0000

On Thu, Dec 31, 2020 at 3:35 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Import CRC16 calculation routines from Linux kernel v5.10:
>
>   include/linux/crc-ccitt.h
>   lib/crc-ccitt.c
>
> to QEMU:
>
>   include/qemu/crc-ccitt.h
>   util/crc-ccitt.c
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/qemu/crc-ccitt.h |  33 ++++++++++
>  util/crc-ccitt.c         | 127 +++++++++++++++++++++++++++++++++++++++
>  util/meson.build         |   1 +
>  3 files changed, 161 insertions(+)
>  create mode 100644 include/qemu/crc-ccitt.h
>  create mode 100644 util/crc-ccitt.c
>
> diff --git a/include/qemu/crc-ccitt.h b/include/qemu/crc-ccitt.h
> new file mode 100644
> index 0000000000..c017a8157e
> --- /dev/null
> +++ b/include/qemu/crc-ccitt.h
> @@ -0,0 +1,33 @@
> +/*
> + * CRC16 (CCITT) Checksum Algorithm
> + *
> + * Copyright (c) 2020 Wind River Systems, Inc.
> + *
> + * Author:
> + *   Bin Meng <bin.meng@windriver.com>
> + *
> + * From Linux kernel v5.10 include/linux/crc-ccitt.h
> + *
> + * SPDX-License-Identifier: GPL-2.0
> + */
> +
> +#ifndef _CRC_CCITT_H
> +#define _CRC_CCITT_H
> +
> +extern uint16_t const crc_ccitt_table[256];
> +extern uint16_t const crc_ccitt_false_table[256];
> +
> +extern uint16_t crc_ccitt(uint16_t crc, const uint8_t *buffer, size_t len);
> +extern uint16_t crc_ccitt_false(uint16_t crc, const uint8_t *buffer, size_t len);
> +
> +static inline uint16_t crc_ccitt_byte(uint16_t crc, const uint8_t c)
> +{
> +    return (crc >> 8) ^ crc_ccitt_table[(crc ^ c) & 0xff];
> +}
> +
> +static inline uint16_t crc_ccitt_false_byte(uint16_t crc, const uint8_t c)
> +{
> +    return (crc << 8) ^ crc_ccitt_false_table[(crc >> 8) ^ c];
> +}
> +
> +#endif /* _CRC_CCITT_H */
> diff --git a/util/crc-ccitt.c b/util/crc-ccitt.c
> new file mode 100644
> index 0000000000..481e45c380
> --- /dev/null
> +++ b/util/crc-ccitt.c
> @@ -0,0 +1,127 @@
> +/*
> + * CRC16 (CCITT) Checksum Algorithm
> + *
> + * Copyright (c) 2020 Wind River Systems, Inc.
> + *
> + * Author:
> + *   Bin Meng <bin.meng@windriver.com>
> + *
> + * From Linux kernel v5.10 lib/crc-ccitt.c
> + *
> + * SPDX-License-Identifier: GPL-2.0-only
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/crc-ccitt.h"
> +
> +/*
> + * This mysterious table is just the CRC of each possible byte. It can be
> + * computed using the standard bit-at-a-time methods. The polynomial can
> + * be seen in entry 128, 0x8408. This corresponds to x^0 + x^5 + x^12.
> + * Add the implicit x^16, and you have the standard CRC-CCITT.
> + */
> +uint16_t const crc_ccitt_table[256] = {
> +    0x0000, 0x1189, 0x2312, 0x329b, 0x4624, 0x57ad, 0x6536, 0x74bf,
> +    0x8c48, 0x9dc1, 0xaf5a, 0xbed3, 0xca6c, 0xdbe5, 0xe97e, 0xf8f7,
> +    0x1081, 0x0108, 0x3393, 0x221a, 0x56a5, 0x472c, 0x75b7, 0x643e,
> +    0x9cc9, 0x8d40, 0xbfdb, 0xae52, 0xdaed, 0xcb64, 0xf9ff, 0xe876,
> +    0x2102, 0x308b, 0x0210, 0x1399, 0x6726, 0x76af, 0x4434, 0x55bd,
> +    0xad4a, 0xbcc3, 0x8e58, 0x9fd1, 0xeb6e, 0xfae7, 0xc87c, 0xd9f5,
> +    0x3183, 0x200a, 0x1291, 0x0318, 0x77a7, 0x662e, 0x54b5, 0x453c,
> +    0xbdcb, 0xac42, 0x9ed9, 0x8f50, 0xfbef, 0xea66, 0xd8fd, 0xc974,
> +    0x4204, 0x538d, 0x6116, 0x709f, 0x0420, 0x15a9, 0x2732, 0x36bb,
> +    0xce4c, 0xdfc5, 0xed5e, 0xfcd7, 0x8868, 0x99e1, 0xab7a, 0xbaf3,
> +    0x5285, 0x430c, 0x7197, 0x601e, 0x14a1, 0x0528, 0x37b3, 0x263a,
> +    0xdecd, 0xcf44, 0xfddf, 0xec56, 0x98e9, 0x8960, 0xbbfb, 0xaa72,
> +    0x6306, 0x728f, 0x4014, 0x519d, 0x2522, 0x34ab, 0x0630, 0x17b9,
> +    0xef4e, 0xfec7, 0xcc5c, 0xddd5, 0xa96a, 0xb8e3, 0x8a78, 0x9bf1,
> +    0x7387, 0x620e, 0x5095, 0x411c, 0x35a3, 0x242a, 0x16b1, 0x0738,
> +    0xffcf, 0xee46, 0xdcdd, 0xcd54, 0xb9eb, 0xa862, 0x9af9, 0x8b70,
> +    0x8408, 0x9581, 0xa71a, 0xb693, 0xc22c, 0xd3a5, 0xe13e, 0xf0b7,
> +    0x0840, 0x19c9, 0x2b52, 0x3adb, 0x4e64, 0x5fed, 0x6d76, 0x7cff,
> +    0x9489, 0x8500, 0xb79b, 0xa612, 0xd2ad, 0xc324, 0xf1bf, 0xe036,
> +    0x18c1, 0x0948, 0x3bd3, 0x2a5a, 0x5ee5, 0x4f6c, 0x7df7, 0x6c7e,
> +    0xa50a, 0xb483, 0x8618, 0x9791, 0xe32e, 0xf2a7, 0xc03c, 0xd1b5,
> +    0x2942, 0x38cb, 0x0a50, 0x1bd9, 0x6f66, 0x7eef, 0x4c74, 0x5dfd,
> +    0xb58b, 0xa402, 0x9699, 0x8710, 0xf3af, 0xe226, 0xd0bd, 0xc134,
> +    0x39c3, 0x284a, 0x1ad1, 0x0b58, 0x7fe7, 0x6e6e, 0x5cf5, 0x4d7c,
> +    0xc60c, 0xd785, 0xe51e, 0xf497, 0x8028, 0x91a1, 0xa33a, 0xb2b3,
> +    0x4a44, 0x5bcd, 0x6956, 0x78df, 0x0c60, 0x1de9, 0x2f72, 0x3efb,
> +    0xd68d, 0xc704, 0xf59f, 0xe416, 0x90a9, 0x8120, 0xb3bb, 0xa232,
> +    0x5ac5, 0x4b4c, 0x79d7, 0x685e, 0x1ce1, 0x0d68, 0x3ff3, 0x2e7a,
> +    0xe70e, 0xf687, 0xc41c, 0xd595, 0xa12a, 0xb0a3, 0x8238, 0x93b1,
> +    0x6b46, 0x7acf, 0x4854, 0x59dd, 0x2d62, 0x3ceb, 0x0e70, 0x1ff9,
> +    0xf78f, 0xe606, 0xd49d, 0xc514, 0xb1ab, 0xa022, 0x92b9, 0x8330,
> +    0x7bc7, 0x6a4e, 0x58d5, 0x495c, 0x3de3, 0x2c6a, 0x1ef1, 0x0f78
> +};
> +
> +/*
> + * Similar table to calculate CRC16 variant known as CRC-CCITT-FALSE
> + * Reflected bits order, does not augment final value.
> + */
> +uint16_t const crc_ccitt_false_table[256] = {
> +    0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50A5, 0x60C6, 0x70E7,
> +    0x8108, 0x9129, 0xA14A, 0xB16B, 0xC18C, 0xD1AD, 0xE1CE, 0xF1EF,
> +    0x1231, 0x0210, 0x3273, 0x2252, 0x52B5, 0x4294, 0x72F7, 0x62D6,
> +    0x9339, 0x8318, 0xB37B, 0xA35A, 0xD3BD, 0xC39C, 0xF3FF, 0xE3DE,
> +    0x2462, 0x3443, 0x0420, 0x1401, 0x64E6, 0x74C7, 0x44A4, 0x5485,
> +    0xA56A, 0xB54B, 0x8528, 0x9509, 0xE5EE, 0xF5CF, 0xC5AC, 0xD58D,
> +    0x3653, 0x2672, 0x1611, 0x0630, 0x76D7, 0x66F6, 0x5695, 0x46B4,
> +    0xB75B, 0xA77A, 0x9719, 0x8738, 0xF7DF, 0xE7FE, 0xD79D, 0xC7BC,
> +    0x48C4, 0x58E5, 0x6886, 0x78A7, 0x0840, 0x1861, 0x2802, 0x3823,
> +    0xC9CC, 0xD9ED, 0xE98E, 0xF9AF, 0x8948, 0x9969, 0xA90A, 0xB92B,
> +    0x5AF5, 0x4AD4, 0x7AB7, 0x6A96, 0x1A71, 0x0A50, 0x3A33, 0x2A12,
> +    0xDBFD, 0xCBDC, 0xFBBF, 0xEB9E, 0x9B79, 0x8B58, 0xBB3B, 0xAB1A,
> +    0x6CA6, 0x7C87, 0x4CE4, 0x5CC5, 0x2C22, 0x3C03, 0x0C60, 0x1C41,
> +    0xEDAE, 0xFD8F, 0xCDEC, 0xDDCD, 0xAD2A, 0xBD0B, 0x8D68, 0x9D49,
> +    0x7E97, 0x6EB6, 0x5ED5, 0x4EF4, 0x3E13, 0x2E32, 0x1E51, 0x0E70,
> +    0xFF9F, 0xEFBE, 0xDFDD, 0xCFFC, 0xBF1B, 0xAF3A, 0x9F59, 0x8F78,
> +    0x9188, 0x81A9, 0xB1CA, 0xA1EB, 0xD10C, 0xC12D, 0xF14E, 0xE16F,
> +    0x1080, 0x00A1, 0x30C2, 0x20E3, 0x5004, 0x4025, 0x7046, 0x6067,
> +    0x83B9, 0x9398, 0xA3FB, 0xB3DA, 0xC33D, 0xD31C, 0xE37F, 0xF35E,
> +    0x02B1, 0x1290, 0x22F3, 0x32D2, 0x4235, 0x5214, 0x6277, 0x7256,
> +    0xB5EA, 0xA5CB, 0x95A8, 0x8589, 0xF56E, 0xE54F, 0xD52C, 0xC50D,
> +    0x34E2, 0x24C3, 0x14A0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,
> +    0xA7DB, 0xB7FA, 0x8799, 0x97B8, 0xE75F, 0xF77E, 0xC71D, 0xD73C,
> +    0x26D3, 0x36F2, 0x0691, 0x16B0, 0x6657, 0x7676, 0x4615, 0x5634,
> +    0xD94C, 0xC96D, 0xF90E, 0xE92F, 0x99C8, 0x89E9, 0xB98A, 0xA9AB,
> +    0x5844, 0x4865, 0x7806, 0x6827, 0x18C0, 0x08E1, 0x3882, 0x28A3,
> +    0xCB7D, 0xDB5C, 0xEB3F, 0xFB1E, 0x8BF9, 0x9BD8, 0xABBB, 0xBB9A,
> +    0x4A75, 0x5A54, 0x6A37, 0x7A16, 0x0AF1, 0x1AD0, 0x2AB3, 0x3A92,
> +    0xFD2E, 0xED0F, 0xDD6C, 0xCD4D, 0xBDAA, 0xAD8B, 0x9DE8, 0x8DC9,
> +    0x7C26, 0x6C07, 0x5C64, 0x4C45, 0x3CA2, 0x2C83, 0x1CE0, 0x0CC1,
> +    0xEF1F, 0xFF3E, 0xCF5D, 0xDF7C, 0xAF9B, 0xBFBA, 0x8FD9, 0x9FF8,
> +    0x6E17, 0x7E36, 0x4E55, 0x5E74, 0x2E93, 0x3EB2, 0x0ED1, 0x1EF0
> +};
> +
> +/**
> + * crc_ccitt - recompute the CRC (CRC-CCITT variant)
> + * for the data buffer
> + *
> + * @crc: previous CRC value
> + * @buffer: data pointer
> + * @len: number of bytes in the buffer
> + */
> +uint16_t crc_ccitt(uint16_t crc, uint8_t const *buffer, size_t len)
> +{
> +    while (len--) {
> +        crc = crc_ccitt_byte(crc, *buffer++);
> +    }
> +    return crc;
> +}
> +
> +/**
> + * crc_ccitt_false - recompute the CRC (CRC-CCITT-FALSE variant)
> + * for the data buffer
> + *
> + * @crc: previous CRC value
> + * @buffer: data pointer
> + * @len: number of bytes in the buffer
> + */
> +uint16_t crc_ccitt_false(uint16_t crc, uint8_t const *buffer, size_t len)
> +{
> +    while (len--) {
> +        crc = crc_ccitt_false_byte(crc, *buffer++);
> +    }
> +    return crc;
> +}
> diff --git a/util/meson.build b/util/meson.build
> index f359af0d46..2bdf778fd9 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -29,6 +29,7 @@ util_ss.add(files('qemu-config.c', 'notify.c'))
>  util_ss.add(files('qemu-option.c', 'qemu-progress.c'))
>  util_ss.add(files('keyval.c'))
>  util_ss.add(files('crc32c.c'))
> +util_ss.add(files('crc-ccitt.c'))
>  util_ss.add(files('uuid.c'))
>  util_ss.add(files('getauxval.c'))
>  util_ss.add(files('rcu.c'))
> --
> 2.25.1
>
>

