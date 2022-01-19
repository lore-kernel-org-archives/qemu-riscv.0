Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA1h3-0003WO-8B
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 22:31:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nA1h1-0003Tp-7S; Tue, 18 Jan 2022 22:31:27 -0500
Received: from [2607:f8b0:4864:20::129] (port=41955
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nA1gw-0004FD-Ij; Tue, 18 Jan 2022 22:31:23 -0500
Received: by mail-il1-x129.google.com with SMTP id r16so1028637ile.8;
 Tue, 18 Jan 2022 19:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i5U3SkIoHvH2SnURx3Z0kzrAMB/9R44sX3aBs6KFp/Y=;
 b=QAcDMzzU7yIukeLL2gE19hiIijpjlI6M/CcxRRBssXNCu5aSxJi3WKfdoYQ9dcbIrs
 lX7ZtO5tr2NgKD6qBdxdTewxOpoy9AS8qzxJtPnh9i16JNk/IGF3lPC2oVKfdaonZrDm
 b5mm3H0Kx8Ma7f91G7SZAF4fpvpEkNvJPgANJAmyLUI4qPy1cYsxa1ACf86VTmpbZ4zM
 VQoe9G58xiE+cPnobRoG726KUsRepf09GjWZcvVXkhXz+7YOr5m0QPRHfEmdAMMc/wmf
 ceYRXxmmRz3pRFrXwfte/Q2c5NYY2v7DqCVOvqA+GhRJsnnVjOwqePqNUT0SfGLwYXPG
 kQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i5U3SkIoHvH2SnURx3Z0kzrAMB/9R44sX3aBs6KFp/Y=;
 b=iW+Cv13KIzrgmpV2I8W9lUCUjbvVa/IcPI8EuAEub4OYs4Rxsv6CuZVtZkK3bVo+Ti
 im+IKJxUeKnMekrcJMxDo0Seh6fbaFFJXGUCljC6MqPeXBmcYks4I4C1R4VHLreJIZEV
 w1E0dxrmha0aeKW57olMhe3OAdNZpG4mQjMdBQ/ZTnWLE+WduLUjdI7Hdnm132orInNO
 PlbMi4qRwloFBPxaSOdPKErsRgDH6wREjI4PT3rpP8R/QUPdVvQlhhp9Dc23oJ+9KGfv
 tKaG9LZKAK791ql/3E8Z0z3gwLaYMWlMojYKr6s/mYButn1uW2rYRV7mRaOrb3wABcrm
 BByg==
X-Gm-Message-State: AOAM532gLKbdVPiLP3MpSQ/65KmfT4l2CAv8tUa3Kb1XqAfpugs10KQs
 S+HpCWQEcFSS6jYWnrstBmau904DcUCpXRo3ni4=
X-Google-Smtp-Source: ABdhPJz/neYIfEgHrzZKJZL0bT78T76bjjiOS9rOSE3h4fhYCWmEZaokgcZqsill9PABhb0BdEQefT+iXlLk5MIXA7s=
X-Received: by 2002:a05:6e02:1569:: with SMTP id
 k9mr15531339ilu.290.1642563080838; 
 Tue, 18 Jan 2022 19:31:20 -0800 (PST)
MIME-Version: 1.0
References: <20220113114004.286796-1-zhiwei_liu@c-sky.com>
 <20220113114004.286796-21-zhiwei_liu@c-sky.com>
In-Reply-To: <20220113114004.286796-21-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jan 2022 13:30:54 +1000
Message-ID: <CAKmqyKO5ghxvdqqkip-1UE7TKLycf5NKMKvt8hPGt1ZdwFfcsg@mail.gmail.com>
Subject: Re: [PATCH v6 20/22] target/riscv: Adjust scalar reg in vector with
 XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 guoren@linux.alibaba.com, Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jan 2022 03:31:27 -0000

On Thu, Jan 13, 2022 at 10:20 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> When sew <= 32bits, not need to extend scalar reg.
> When sew > 32bits, if xlen is less that sew, we should sign extend
> the scalar register, except explicitly specified by the spec.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 1c8086d3a6..b6502cdc7c 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1201,7 +1201,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
>      dest = tcg_temp_new_ptr();
>      mask = tcg_temp_new_ptr();
>      src2 = tcg_temp_new_ptr();
> -    src1 = get_gpr(s, rs1, EXT_NONE);
> +    src1 = get_gpr(s, rs1, EXT_SIGN);
>
>      data = FIELD_DP32(data, VDATA, VM, vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> --
> 2.25.1
>
>

