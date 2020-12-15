Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpDvV-0003JJ-E6
	for mharc-qemu-riscv@gnu.org; Tue, 15 Dec 2020 12:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kpDvT-0003H6-H5; Tue, 15 Dec 2020 12:15:51 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:46520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kpDvQ-00044j-OR; Tue, 15 Dec 2020 12:15:51 -0500
Received: by mail-il1-x141.google.com with SMTP id 75so7883806ilv.13;
 Tue, 15 Dec 2020 09:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MaMh6FeKWEDY+vcYgvizLN31RsfQSmVod5BOjrBrmW8=;
 b=Mm+kQI1ktlBACv71FGcsY1MPA9lYcZiEUUiG+kn9BKDMpp38SEDn6dLzvIGsvD9w3Q
 aikixXh/GovjEtwypBcuzOoPPh+HoY7iTzhcuWs9xl25eNF2A3iXEZ40pdlYQ/kWD2J5
 N428MpV5pFbExOKoX6pvfzKrxpimYdQ3YCnhlJs9SnHr3OSrXHbYWnppu8GkasrK95/Q
 CA8vYsRzGLTGUmYBHuAcs4dVWnpf6Z9GVYuPVRT6GB/jo9jlsX1s0HKAh9+5an3yXcKK
 jeTiqhFEOq/VxyURXJYaXWlkJeTArODG4aiKk1O/hkxdOsJ0XZy45FCyubnpc4VYdRp3
 qQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MaMh6FeKWEDY+vcYgvizLN31RsfQSmVod5BOjrBrmW8=;
 b=dYoV+hs+GF7ccF+7OIpEoMuSD7RMEZkOs9WqzdIp0xg8yBZN4bz8g7lGBqKHtZ98SF
 h0TGrJY/DvN2LXYduodLdh8msjMKaYIfqobwR/w7+cQTQp1dyslzVMEJc4VPp0dMkxbY
 lfzSJL26ZMclJCNwS+0NxesLjpdJuHeUH+bDgT8UoNr0sg6z47ldm113yR6v1GxjsKi0
 h0aZRFssQqzwAeVsaSfZmYaHUFqSdVnMz+JuCQeM1Yuzz6PVDEDav0gSXMLkCLNua9qt
 OuHjkipFzrWUvMArVPXHO0cGW6lUrXaQkNFpDGPOSCbNef5bRjub95wXAb7EZZOhqD9h
 e/9Q==
X-Gm-Message-State: AOAM531iwcxGVQ+AaL0Oz9JwzOC0pUC+aMtenntSoMytpMJCFaNO2HCd
 OL1U+JBT8AprvIF0awXYI/4B4dezZHtDYwE8JIA=
X-Google-Smtp-Source: ABdhPJypJC7VhYjU98GibTk5iOiLPnWcmIGjfLNRnQlWoQNHH3zMCDnVJEbFe5TdRde4ViO8hKU1jqcAZX+3H7cUIcU=
X-Received: by 2002:a92:dc0f:: with SMTP id t15mr42238258iln.267.1608052547481; 
 Tue, 15 Dec 2020 09:15:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607967113.git.alistair.francis@wdc.com>
 <2cffe9cb8055c9451872b3a08192e19fec12fb1a.1607967113.git.alistair.francis@wdc.com>
 <CAEUhbmUhKuhEPU=RyRN3CVYDh=oGoQF1e-tSX=jODw4c2Ub1kA@mail.gmail.com>
 <97fe497a-06c0-43e4-3144-eee0c439686a@linaro.org>
In-Reply-To: <97fe497a-06c0-43e4-3144-eee0c439686a@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Dec 2020 09:15:20 -0800
Message-ID: <CAKmqyKNKA5jmAcHiJAvBXBFnnk+R9GLxOOLQTxam2KB4hSXmgA@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] target/riscv: fpu_helper: Match function defs in
 HELPER macros
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
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
X-List-Received-Date: Tue, 15 Dec 2020 17:15:51 -0000

On Tue, Dec 15, 2020 at 7:13 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/15/20 3:38 AM, Bin Meng wrote:
> >>  #if defined(TARGET_RISCV64)
> >> -uint64_t helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)
> >> +target_ulong helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)
> >>  {
> >>      float32 frs1 = check_nanbox_s(rs1);
> >>      return float32_to_int64(frs1, &env->fp_status);
> >
> > float32_to_int64() returns int64_t, so there is a truncation if
> > changing it to target_ulong for 32-bit.
>
> There's not, because this function isn't defined for 32-bit (see first quoted
> line).  But this point of confusion is exactly what I pointed out vs the
> previous revision.

Ok, I have swapped this to changing helper.h now.

Alistair

>
>
> r~

