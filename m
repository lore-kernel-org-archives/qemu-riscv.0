Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ni2OT-0006bB-1G
	for mharc-qemu-riscv@gnu.org; Fri, 22 Apr 2022 19:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ni2OL-0006al-48; Fri, 22 Apr 2022 19:08:46 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:34357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ni2OI-0002bC-At; Fri, 22 Apr 2022 19:08:44 -0400
Received: by mail-io1-xd33.google.com with SMTP id i196so10128629ioa.1;
 Fri, 22 Apr 2022 16:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=StcNUHjgtj7f9ZmiCvSNOu4tXRYsBwlZSc9lwSdnLjM=;
 b=Nz54OdlVMc8D44IGu14P7pDZHl1NlTEIdT74s3C3NGmYs8F4kLz/xlngoInfAJaLCy
 jIxqBEzDjhQ9hk/KZAvy3x8Srryr59jTD5/bn2M8bzc+XcI8cpILZkdHfUnF6mXMD++H
 ma0uCbEEGmLNjH+ars7g12djwJ98QJuwbYh8mH8sHCLD5mhQFH5FXuY55+/T5RLKBCTf
 EJZlQmiRu40IQi+gvpwmHVN0WmwrTqDmGo4wRioZrS9hG/gwRcTmfdJqORKjRznaEsOc
 V/38PmIiPLCh4+ZXp8b4g0Aofm6mK6zl95TRYwUR7v1P3kyTwOVlqb8naar7K19gFjWj
 F5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=StcNUHjgtj7f9ZmiCvSNOu4tXRYsBwlZSc9lwSdnLjM=;
 b=ZFVnluP5/oHmE9PA8aXNdllfGnHGF20MoJMLgHaJ0rHwiwXgP++9CfySxM+OYrmPAa
 PcnVZE0vNRQFIpafeZoTdcYbtQmiGIQpzYsrdExZWgdZQCaI2z33iGDz/e7QnjVz6Oft
 uB/Z9fV8aGuCn1o/GMh6kMnbGLH4GvbvLJ9yCsQ9xnlEiuRsTUCFnHStvxd2dbtwWfIu
 M/DTANgrIuhtRzUrxhk/WvE4jkc6kmlh2hiaUcosI6Vu6HypRZM1XR1/mK0o8bt38eAo
 WHn3z+3AcYVBXii7cdwLVh8KL6JAe9KdMWIl9/VVkf9BSW5X5tErYUM+gbackJ5tmXH9
 E7Ag==
X-Gm-Message-State: AOAM531nv83tmWYLNivp57F7X3JwkLspehO6TezMpIP+gdrdjy21kB+e
 RwhweXdu2H7r9E+ACbT3W/AabpYQa7+IbP1APKw=
X-Google-Smtp-Source: ABdhPJy/veYTETdZgb+k9aQ4UlfQZuCLzTGM3kA/gOzFeTgjDf/T/mxIafDf+o4w414L3315Rd245auxscN4+V+Lfpk=
X-Received: by 2002:a05:6638:3724:b0:32a:ab86:3f9 with SMTP id
 k36-20020a056638372400b0032aab8603f9mr3265864jav.267.1650668920992; Fri, 22
 Apr 2022 16:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220401122248.2792180-1-ralf.ramsauer@oth-regensburg.de>
 <20220404173417.2946065-1-ralf.ramsauer@oth-regensburg.de>
 <CAEUhbmXZo=RSGSOoJQRTfsRF8z3gEntgKZDNmptLsvja-z6u+w@mail.gmail.com>
 <CAEUhbmUTSX3EYu7=-S-o-iYxZzVbpkZWeLqnDTB-R9mUn20HDA@mail.gmail.com>
 <38fe04aa-17e8-591c-fa65-ee9d931ed45c@oth-regensburg.de>
In-Reply-To: <38fe04aa-17e8-591c-fa65-ee9d931ed45c@oth-regensburg.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 23 Apr 2022 09:08:15 +1000
Message-ID: <CAKmqyKNtcV3MN0qzVEOgty=o137-QfYm4_c_hHmb1O9YfhSiQQ@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH v2] target/riscv: Fix incorrect PTE merge in
 walk_pte
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Stefan Huber <stefan.huber@oth-regensburg.de>, 
 Konrad Schwarz <konrad.schwarz@siemens.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Fri, 22 Apr 2022 23:08:48 -0000

On Fri, Apr 22, 2022 at 10:10 PM Ralf Ramsauer
<ralf.ramsauer@oth-regensburg.de> wrote:
>
>
>
> On 22/04/2022 04:54, Bin Meng wrote:
> > On Fri, Apr 22, 2022 at 10:53 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> On Tue, Apr 5, 2022 at 1:34 AM Ralf Ramsauer
> >> <ralf.ramsauer@oth-regensburg.de> wrote:
> >>>
> >>> Two non-subsequent PTEs can be mapped to subsequent paddrs. In this
> >>> case, walk_pte will erroneously merge them.
> >>>
> >>> Enforce the split up, by tracking the virtual base address.
> >>>
> >>> Let's say we have the mapping:
> >>> 0x81200000 -> 0x89623000 (4K)
> >>> 0x8120f000 -> 0x89624000 (4K)
> >>>
> >>> Before, walk_pte would have shown:
> >>>
> >>> vaddr            paddr            size             attr
> >>> ---------------- ---------------- ---------------- -------
> >>> 0000000081200000 0000000089623000 0000000000002000 rwxu-ad
> >>>
> >>> as it only checks for subsequent paddrs. With this patch, it becomes:
> >>>
> >>> vaddr            paddr            size             attr
> >>> ---------------- ---------------- ---------------- -------
> >>> 0000000081200000 0000000089623000 0000000000001000 rwxu-ad
> >>> 000000008120f000 0000000089624000 0000000000001000 rwxu-ad
> >>>
> >>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> >>> ---
> >>>   target/riscv/monitor.c | 5 ++++-
> >>>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
> >>> index 7efb4b62c1..9dc4cb1156 100644
> >>> --- a/target/riscv/monitor.c
> >>> +++ b/target/riscv/monitor.c
> >>> @@ -84,6 +84,7 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
> >>>   {
> >>>       hwaddr pte_addr;
> >>>       hwaddr paddr;
> >>> +    target_ulong last_start = -1;
> >>>       target_ulong pgsize;
> >>>       target_ulong pte;
> >>>       int ptshift;
> >>> @@ -116,7 +117,8 @@ static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
> >>>                    * contiguous mapped block details.
> >>>                    */
> >>
> >> Please also update the comments above to mention the new case you added here.
>
> Shall I provide a v3? No problem, if that makes your life easier.
> Otherwise, you could also squash attached comment on integration.

Yes, please submit a v3

Alistair

>
> Thanks
>    Ralf
>
> diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
> index 02512ed48f..1cb0932e03 100644
> --- a/target/riscv/monitor.c
> +++ b/target/riscv/monitor.c
> @@ -143,9 +143,9 @@ static void walk_pte(Monitor *mon, hwaddr base,
> target_ulong start,
>                    * A leaf PTE has been found
>                    *
>                    * If current PTE's permission bits differ from the
> last one,
> -                 * or current PTE's ppn does not make a contiguous physical
> -                 * address block together with the last one, print out
> the last
> -                 * contiguous mapped block details.
> +                * or the current PTE breaks up a contiguous virtual or
> +                * physical mapping, address block together with the
> last one,
> +                * print out the last contiguous mapped block details.
>                    */
>                   if ((*last_attr != attr) ||
>                       (*last_paddr + *last_size != paddr) ||
>

