Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9rG9-0006cq-63
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 11:23:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1n9r1q-0001bK-Q5; Tue, 18 Jan 2022 11:08:17 -0500
Received: from mail-vk1-f179.google.com ([209.85.221.179]:38830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1n9r1o-0000HV-6R; Tue, 18 Jan 2022 11:08:14 -0500
Received: by mail-vk1-f179.google.com with SMTP id h16so12584228vkp.5;
 Tue, 18 Jan 2022 08:08:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=sAjjxejaqSq/HtYhLJwM2clpnGt8/7CjejnXcBUMWFI=;
 b=cvSexapQZ6ugE/YFUUQnRpOySAPpj6ebghFYQG183XdYmL6cD+PffJ8XffAM9wm3Cl
 MYrODqa4Sda6+tOacI0ZOvesNK/cKBOzAVv/wpum8fO3IxBMqSbJ4wiffkym2Qz7Lwnf
 +FtjFk9RCDxZtYmKnXabqNHGjfEnZORz3nWNVQpjgrfBXAHVmOwMuXDbPI5ZVCvsNnBs
 8n0uevMBw2E7cuZrRINdPDECne4OzSTozUVi2/7apT1s3XVeaEqSuTnWWCHCY6KhB4FC
 hKNRKReIF0GtJ5EUuvrO1Rs51KI4ejVbDXw3XJ6hhgnq2Nd3lN4BxEyxjXboX/bwAkb0
 C/vQ==
X-Gm-Message-State: AOAM533IaeAwDi6NwOfzW2CxTW/PoBYVKNyDAqc8zpZLpHTF0Yee7zzm
 2njIsv3sZHIwTJ8YnI1X+hwNWyqWcRZ7s+rx
X-Google-Smtp-Source: ABdhPJxwnEczEtOlATT9JpE2K7Kng4qEY1uFa4RQUTymJztl5oBpPop9jxzSowL9SvL1iRBc+GyTGQ==
X-Received: by 2002:a05:6122:218b:: with SMTP id
 j11mr6950117vkd.19.1642522086789; 
 Tue, 18 Jan 2022 08:08:06 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52])
 by smtp.gmail.com with ESMTPSA id j129sm3784059vkh.16.2022.01.18.08.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 08:08:06 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id b16so3137840uaq.4;
 Tue, 18 Jan 2022 08:08:06 -0800 (PST)
X-Received: by 2002:a05:6102:108c:: with SMTP id
 s12mr9924606vsr.20.1642522086069; 
 Tue, 18 Jan 2022 08:08:06 -0800 (PST)
MIME-Version: 1.0
References: <20220118151226.2565053-1-cmuellner@linux.com>
In-Reply-To: <20220118151226.2565053-1-cmuellner@linux.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <cmuellner@gcc.gnu.org>
Date: Tue, 18 Jan 2022 17:07:54 +0100
X-Gmail-Original-Message-ID: <CAHB2gtRG9hfBm-VDmgW6bE2VY7vr+9DtRxektOsLFSzu5y93Cg@mail.gmail.com>
Message-ID: <CAHB2gtRG9hfBm-VDmgW6bE2VY7vr+9DtRxektOsLFSzu5y93Cg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix RV128 lq encoding
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.221.179;
 envelope-from=christophm30@gmail.com; helo=mail-vk1-f179.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 Jan 2022 11:22:46 -0500
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
X-List-Received-Date: Tue, 18 Jan 2022 16:08:17 -0000

Resend from the correct email address to get accepted by Mailman.

On Tue, Jan 18, 2022 at 4:12 PM Christoph Muellner <cmuellner@linux.com> wrote:
>
> If LQ has func3==010 and is located in the MISC-MEM opcodes,
> then it conflicts with the CBO opcode space.
> However, since LQ is specified as: "LQ is added to the MISC-MEM major
> opcode", we have an implementation bug, because 'major opcode'
> refers to func3, which must be 111.
>
> This results in the following instruction encodings:
>
> lq        ........ ........ .111.... .0001111
> cbo_clean 00000000 0001.... .0100000 00001111
> cbo_flush 00000000 0010.... .0100000 00001111
> cbo_inval 00000000 0000.... .0100000 00001111
> cbo_zero  00000000 0100.... .0100000 00001111
>                              ^^^-func3
>                                       ^^^^^^^-opcode
>
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> ---
>  target/riscv/insn32.decode | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 5bbedc254c..d3f798ca10 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -168,7 +168,7 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
>
>  # *** RV128I Base Instruction Set (in addition to RV64I) ***
>  ldu      ............   ..... 111 ..... 0000011 @i
> -lq       ............   ..... 010 ..... 0001111 @i
> +lq       ............   ..... 111 ..... 0001111 @i
>  sq       ............   ..... 100 ..... 0100011 @s
>  addid    ............  .....  000 ..... 1011011 @i
>  sllid    000000 ......  ..... 001 ..... 1011011 @sh6
> --
> 2.34.1
>

