Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDb23-0004DJ-Qc
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jul 2022 20:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDb22-0004D6-Py; Mon, 18 Jul 2022 20:24:10 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDb20-0007So-Mg; Mon, 18 Jul 2022 20:24:10 -0400
Received: by mail-pf1-x430.google.com with SMTP id b9so12092767pfp.10;
 Mon, 18 Jul 2022 17:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2RYaVqsWYKi7vZojfcQH1kVo4AmTPs1FpVLB9ZEoC3U=;
 b=NgA089cmYnOEeJihY92ffxTjqMLQMGE9BZzBE5ejlepNhBSU9gDInEGkido+Jg7ddX
 cu8DsC0JwYhXSPRNLzpaccWh0ESQEDRij75/K90zEekB9Lw3Cxy8r1qYAqiscLsOUuF4
 BgH5+L857KIKPjzN6pLiu7owBI36jAyOZNm2CPEriBsCbDWQyliS+OvVECAuurTXTshW
 zAn+xoCNe8A+rGuLSDToVSdzYPWDaoph+Zv2Ab7yKMMQ6DBzo9v6M0c/DJFprfadMceb
 QEDd4MbBMWkNdimeDeBgx2BqSSAZie7kHCEwsIH7KXK+sBRY32Ylabek2kd9iYeH8bo5
 6dLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2RYaVqsWYKi7vZojfcQH1kVo4AmTPs1FpVLB9ZEoC3U=;
 b=0buABCOrl0zNV7g8Dwe46F2FsOjKvzYHk8gVkVjNlUZiybGwgPMwe/bJQspGOcVoEc
 xmY+G+Umluu0OvRTeYFYchj4/CUYDrSx3AIr3rjvsrDdxQnuQco7SkkjAs0r+Os6PTw3
 R6AYALGVmghfgwTKAgSTURUxvpeDpnAX4GQyg4WgdZ7fPDSd6zFKufV7nZUHQ9Z+nT3H
 dNYg85F23pSa+FaNH6BWbq5yPDrshkG8muvThWNIWGrNa+5K79hv61Q1zU3R+zz5k7MH
 lYTD28qhJAysOAVIMgRlzMXI+BjTmRnUk+k6je2drBho7tVDZTUlCcnQ3PyS+bTTxfh+
 x9+Q==
X-Gm-Message-State: AJIora8nq277Y7sbPqF/U0cCbmX50fMCwa7vJM9diu29IsCQRYKpr22O
 6QYvqfywy5+4jPYAcHH6TRpSjmMT+OwXbi8eq84=
X-Google-Smtp-Source: AGRyM1vTA+ZSZcCx1jTB2ZCg14UrvnU49RrR2c/rKoYvXiJou/E+Gz7tvsXxwnvu9S13Vk/eL1PKAyx91lQmsbl9Ftc=
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id
 d10-20020a656b8a000000b003db7dc5fec2mr26078826pgw.223.1658190246896; Mon, 18
 Jul 2022 17:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220718130955.11899-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220718130955.11899-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jul 2022 10:23:40 +1000
Message-ID: <CAKmqyKNivL5AVHSbL8JuaxOv9fv3y0Mo3TN0TpPB6Rt7+XWbvw@mail.gmail.com>
Subject: Re: [PATCH V3 0/6] Improve the U/S/H extension related check
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jul 2022 00:24:11 -0000

On Mon, Jul 18, 2022 at 11:10 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> This patchset tries to improve the U/S/H related check:
> * add check for the supported privilege modes conbinations: only supporting M,
> S mode is not a suggested combination
> * add check for "H extension depends on I extension"
> * add check for "H extension implicitly requires S mode"
> * add check for csrs only existed when U mode is supported
> * fix and simplify the checks in hmode/hmode32
>
> Any suggestions are welcome.
>
> v3:
> * Fix the issues suggested by Andrew Jones in commit messages
>
> v2:
> * update patch 3 to make the newlines start at the same position as above line
> * update patch 5 to add check for "H extension implicitly requires S mode"
>
> Weiwei Li (6):
>   target/riscv: Add check for supported privilege mode combinations
>   target/riscv: H extension depends on I extension
>   target/riscv: Fix checkpatch warning may triggered in csr_ops table
>   target/riscv: Add check for csrs existed with U extension
>   target/riscv: Fix checks in hmode/hmode32
>   target/riscv: Simplify the check in hmode to resue the check in
>     riscv_csrrw_check

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c |  17 ++
>  target/riscv/csr.c | 490 ++++++++++++++++++++++++---------------------
>  2 files changed, 278 insertions(+), 229 deletions(-)
>
> --
> 2.17.1
>
>

