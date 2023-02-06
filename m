Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOp2C-00043y-Ds
	for mharc-qemu-riscv@gnu.org; Sun, 05 Feb 2023 19:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pOp2A-00043m-VX; Sun, 05 Feb 2023 19:06:59 -0500
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pOp29-0006Bx-Gu; Sun, 05 Feb 2023 19:06:58 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id bs10so5349468vkb.3;
 Sun, 05 Feb 2023 16:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fHkCCr0iERJp7QnD1+eSwqg4GXO/TAo1lZdWzlJc5JY=;
 b=Qx/VueE0GI25+iPVW2Dfn/kDNkF+4wx5A+pp7krFUqZXZYAGBzokviGSMi71uJt3CQ
 F4lu8kvQ9RRqB6wjWY+E+3gUgl/Z94Pov9a1I7Dtdnb8XFSw0kpsUcnPShXKLGbzuBP3
 G3EFCjfII8pAGLmOthTJbizM1d0GOY/uZrYsMAMYm2mYqBqyaIOrDTOVDN0rRfpHl/Bg
 exLckVP8uJ2xY8oA+e1i5Azmbd2IilfZNKMq9cIjDSlbG+GGdgtQigCbSbDH1Top52E7
 vMVFgpT8ZEFv0lU2RJ6sVzPX6bCfcm5ACBLtqZcRfS1OYbYdNe86NQbfMgtFi6pPXpdW
 CV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fHkCCr0iERJp7QnD1+eSwqg4GXO/TAo1lZdWzlJc5JY=;
 b=gqGgMjv5LBhCPRyZIW3zSBysDMxyhNPPDBQ9Jd5UkfOWSUQoCHcLwfzMbKRQKtKghr
 JNv2sSsMBw6g6vAiT0YoPTg9wfxVyAYXDV1Rx+VuC4UXBGJxY5ylQHblmjtUq6O3uD7Z
 RZUo6H50QqUIOwmtaQ162wWFOSRFECgemDydUew6/p1XkJ4AbnePGHXlfb3tc6aKRBbO
 726Om+lFOs7H5Tdzf4ltOWp2xfI09dq+j9SrpBiPuCFqwrLKZYEXRzf4MSy7vgXT37aA
 3yz8HgPUh7cAWhW9l+U+8jpbE3rYTfHQeYFM9R2quZ63jiAbJxlCArBkcRuabLgennqm
 Qdtw==
X-Gm-Message-State: AO0yUKVI6fyWh2McS6f4U95zSyS0fg7sJY+owpajYwqR5W15Uig+VwDL
 pyyUhaez0IjadbdjsyOiWqJHyH+6drC48oz8zEQ=
X-Google-Smtp-Source: AK7set9dB1m8QlrJ9WSiXQahBNM52LNb0WYzDs61K+PUefLJEA8EbTldjR75URgzok8xoJ+RgdI6T+LNxTxpjkMaRrk=
X-Received: by 2002:a05:6122:c4:b0:3e2:4afc:40ab with SMTP id
 h4-20020a05612200c400b003e24afc40abmr2602087vkc.25.1675642016187; Sun, 05 Feb
 2023 16:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20230203135155.12449-1-vladimir.isaev@syntacore.com>
In-Reply-To: <20230203135155.12449-1-vladimir.isaev@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Feb 2023 10:06:30 +1000
Message-ID: <CAKmqyKPFQ=jiQeM3Frn6bF4d=vREAHxVwF7zwg87Sw+yGcQGow@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix SBI getchar handler for KVM
To: Vladimir Isaev <vladimir.isaev@syntacore.com>
Cc: qemu-riscv@nongnu.org, pbonzini@redhat.com, bin.meng@windriver.com, 
 alistair.francis@wdc.com, palmer@dabbelt.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
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
X-List-Received-Date: Mon, 06 Feb 2023 00:06:59 -0000

On Sat, Feb 4, 2023 at 12:03 AM Vladimir Isaev
<vladimir.isaev@syntacore.com> wrote:
>
> Character must be returned via ret[0] field (copied to a0 by KVM).
>
> Return value should be set to 0 to indicate successful processing.
>
> Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/kvm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 30f21453d69c..0f932a5b966e 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -467,10 +467,11 @@ static int kvm_riscv_handle_sbi(CPUState *cs, struct kvm_run *run)
>      case SBI_EXT_0_1_CONSOLE_GETCHAR:
>          ret = qemu_chr_fe_read_all(serial_hd(0)->be, &ch, sizeof(ch));
>          if (ret == sizeof(ch)) {
> -            run->riscv_sbi.args[0] = ch;
> +            run->riscv_sbi.ret[0] = ch;
>          } else {
> -            run->riscv_sbi.args[0] = -1;
> +            run->riscv_sbi.ret[0] = -1;
>          }
> +        ret = 0;
>          break;
>      default:
>          qemu_log_mask(LOG_UNIMP,
> --
> 2.39.1
>
>

