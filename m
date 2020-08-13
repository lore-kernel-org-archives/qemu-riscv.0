Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6FXC-0000rO-4a
	for mharc-qemu-riscv@gnu.org; Thu, 13 Aug 2020 11:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6FXA-0000qy-4H
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2020 11:52:52 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6FX7-000510-0i
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2020 11:52:51 -0400
Received: by mail-pf1-x441.google.com with SMTP id d22so3022945pfn.5
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2020 08:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WklLjhrK4drp0xRZmPRh6kdz36FUhluTGwFzcvWObQA=;
 b=Pl8HTqnUsuIzNwZE/W5mtmF19FQB5lN/3+PvfiqhEJXY/tVWx53i4ZYpxgS3x9GlTd
 Y4ILOfJJpWiFexo5CYlhHcckMaQLzkN/b5s8qSrRxT+hyabEROyNJ21tjWwNsqnazCuq
 nH77fbjLaOFnVemUcGk/Cnady9EO9Uj/IH2x0+8EGcM+xUDewHKbT3b5y/rtQn8yozqY
 bTJto898H9zvnydsvJv5XbOF6JEOq5+cIqxwYZf+TIeEaInvQwzHHlFDj3hG8ZiGeOIX
 LAu6bhZruiLFBKuT7FYG7Ih9GczwT+SbXhtQQT8mv2UF17PAIpbNZkgWZ+4V30TY3E0Q
 j2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WklLjhrK4drp0xRZmPRh6kdz36FUhluTGwFzcvWObQA=;
 b=YmMGvPvvtw1gEL/m1RJErc4X0cUKMqpSuaEm0S9xO09+MW9Kls895Gl/Mb4HEhJhaQ
 04TbwjySIQ06ZGdiuER8Ls4K5ejbXogBmurIzhwvmz7+5S/yGpK1QX3u0rDi77/fq8lg
 X/z71ZGuMkER1eIGfWqzhrzQXPgld1YJitvcOPyroKAkRyLP3aFTi6wyvm1XXn/SRSOE
 n8p2BB6KJQO77Al3DquwU+7cLTar6sXTn8sF3P0ItVVuHhxg2F86QxCKt4i1vBIECyck
 I0GO6vqsBUqbF1vWjvnD2XBPsuByQRZ+tyOb7yF00X3a1w+ALl/lIaUJRAyZVuXX+Jsw
 yAwg==
X-Gm-Message-State: AOAM530wlEPM29oVbMHJzqQ0iFuHLj8mwKeoye7SeoXR8T6RsVSn7wUG
 392WpllPPm6V5kjZ1i2vwie5qw==
X-Google-Smtp-Source: ABdhPJy+1iQZ/e3qLYKw8rFGg3boHO8efYvj355YTE1z4TXekPJoJ6w+nBjaBgv/He3+zvFvNd6wYg==
X-Received: by 2002:a63:ef46:: with SMTP id c6mr4223122pgk.96.1597333967039;
 Thu, 13 Aug 2020 08:52:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id o192sm6774426pfg.81.2020.08.13.08.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2020 08:52:46 -0700 (PDT)
Subject: Re: [PATCH 3/3] target/riscv: Update MTINST/HTINST CSR in
 riscv_cpu_do_interrupt()
To: Alistair Francis <alistair23@gmail.com>, Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel
 <anup@brainfault.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20200729112801.108985-1-anup.patel@wdc.com>
 <20200729112801.108985-4-anup.patel@wdc.com>
 <CAKmqyKMCYutR5TNvbJ3nA0rAu4W0xFVsZRm66W7Fi_Nw3joiBw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c2624d4f-41f9-8a84-9694-7897cd80c2d0@linaro.org>
Date: Thu, 13 Aug 2020 08:52:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMCYutR5TNvbJ3nA0rAu4W0xFVsZRm66W7Fi_Nw3joiBw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 13 Aug 2020 15:52:52 -0000

On 8/12/20 4:16 PM, Alistair Francis wrote:
> I don't like that we have to manually decode the instructions. As it's
> only a handful it's not the end of the world, but it seems like
> duplication that could grow. Could we not use decode_insn16() instead?
> That way we can share the well tested TCG decoder.

Certainly.  Compare how the decoder can be re-purposed for disassembly -- e.g.
target/openrisc/disas.c.

Perhaps something like

typedef uint32_t DisasContext;

#include "decode_insn16.inc.c"

/*
 * This function is supposed to be called for an instruction
 * that has already executed, and thus is known to be valid.
 * That said, return 0 for an invalid instruction.
 */
uint32_t riscv_expand_rvc_to_rvi(uint16_t insn16)
{
    uint32_t insn32 = 0; /* illegal instruction */
    decode_insn16(&insn32, insn16);
    return insn32;
}

static bool expand_i(DisasContext *ctx, arg_immi *a,
                     uint32_t insn32)
{
    insn32 = SET_RD(insn32, a->rd);
    insn32 = SET_RS1(insn32, a->rs1);
    insn32 = SET_I_IMM(insn32, a->imm);
    *ctx = insn32;
    return true;
}

static bool trans_addi(DisasContext *ctx, arg_immi *a)
{
    return expand_i(ctx, a, OPC_RISC_ADDI);
}

etc.  All placed in a new file, so that the myriad symbols don't conflict with
anything else.


r~

