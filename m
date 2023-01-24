Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK7eG-0004VW-QR
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 19:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK7eF-0004VC-CY; Mon, 23 Jan 2023 19:58:51 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK7eC-00026y-B3; Mon, 23 Jan 2023 19:58:50 -0500
Received: by mail-vs1-xe30.google.com with SMTP id 187so14927284vsv.10;
 Mon, 23 Jan 2023 16:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nlkX6SH/ooIVPtU9j9xk3s0ijI5Nl4gadVZnzHW31P8=;
 b=eFKelf/WRftVyBD8nFOoyE7GmBEhRGo+RR0j6qSe57UTRvzAFxO3/dXDDambmDPivH
 wN6Nw556/vMdtzTdEUHI0BCwNGTVExiYDVLz4u0CLOjImsdWIChYar0Prtb42eatE+h+
 MQMvgzQGTvGhibCy6HWDgSqZ1KJIuErT0LoDprqtmKslPDnmg75Y6S7C+kzvuri5UohZ
 eEYN5/e1n8Kl6v190piS4w8uopHXVh+Mxxd+jkwRLTWQRIZvUFyWT5+E4xboK+KEWScw
 md1phN/9Bz3U+qpoIBBTB/88LMOwlWvT4Ge9oxhTFC6FQLl0yls8OXJujSsh4pD+FmHO
 rkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nlkX6SH/ooIVPtU9j9xk3s0ijI5Nl4gadVZnzHW31P8=;
 b=P3HIGDZmIY52RClBTRhLGL/+4p9izMvt8nycemkIV15OslsM6GlgxAEqRfTCswOHw4
 w2n/r2Ndl17UMLA2p+bDtnEc+scWk8hmvLeTD5otR4HDb/7UR+j8EMeN292cqhl9trUk
 gCu6K/pzLQ+uVM0Jt0PuqCTXzJ/97wwYFSzoSDD0VCDSD/nKQ+9TkEeK/Jw9O0RbHVD3
 fmkqddMN0u1JwUpnw6KgGUfvP7bYK2V0lktZVNsaqTRobx4SvoTGza8h6hAke36Gjsb7
 GW1fL0J70AH+AHS93ACfubtCO5gKZEVIPj12MycqFrdQXl9wyytxsDPfPnjlGyIqb8F7
 GAXA==
X-Gm-Message-State: AFqh2krJ8K8OsIGSXWgC2a4JbHbzbeKjtpyjcjX2gjOaoxZygPCikeU8
 /PZo5EOUqDONGAJRN32MWFVlvOGlJkMyv7PgPp8=
X-Google-Smtp-Source: AMrXdXv7UCtkzCti10or3ZcorrUk5marVsWNRimkWJ4RjhSnH69Jy7TacLrbTiqZONNitk+irQFu4pvmCbxL0y7bCNI=
X-Received: by 2002:a67:e14a:0:b0:3d3:f10a:4f56 with SMTP id
 o10-20020a67e14a000000b003d3f10a4f56mr3523586vsl.10.1674521926763; Mon, 23
 Jan 2023 16:58:46 -0800 (PST)
MIME-Version: 1.0
References: <20230120125950.2246378-1-apatel@ventanamicro.com>
In-Reply-To: <20230120125950.2246378-1-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 10:58:20 +1000
Message-ID: <CAKmqyKMc1UzewDKeMeOhBukoTOgujRZAXXVE9MXsikBDMiGkpQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Nested virtualization fixes for QEMU
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
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
X-List-Received-Date: Tue, 24 Jan 2023 00:58:51 -0000

On Fri, Jan 20, 2023 at 11:01 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series mainly includes fixes discovered while developing nested
> virtualization running on QEMU.
>
> These patches can also be found in the riscv_nested_fixes_v3 branch at:
> https://github.com/avpatel/qemu.git
>
> Changes since v2:
>  - Dropped PATCH1 since it is already merged
>  - Rebased on latest riscv-to-apply.next branch of Alistair
>
> Changes since v1:
>  - Added Alistair's Reviewed-by tags to appropriate patches
>  - Added detailed comment block in PATCH4
>
> Anup Patel (4):
>   target/riscv: Update VS timer whenever htimedelta changes
>   target/riscv: Don't clear mask in riscv_cpu_update_mip() for VSTIP
>   target/riscv: No need to re-start QEMU timer when timecmp ==
>     UINT64_MAX
>   target/riscv: Ensure opcode is saved for all relevant instructions

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu_helper.c                   |  2 --
>  target/riscv/csr.c                          | 16 +++++++++
>  target/riscv/insn_trans/trans_rva.c.inc     | 10 ++++--
>  target/riscv/insn_trans/trans_rvd.c.inc     |  2 ++
>  target/riscv/insn_trans/trans_rvf.c.inc     |  2 ++
>  target/riscv/insn_trans/trans_rvh.c.inc     |  3 ++
>  target/riscv/insn_trans/trans_rvi.c.inc     |  2 ++
>  target/riscv/insn_trans/trans_rvzfh.c.inc   |  2 ++
>  target/riscv/insn_trans/trans_svinval.c.inc |  3 ++
>  target/riscv/time_helper.c                  | 36 ++++++++++++++++++---
>  10 files changed, 69 insertions(+), 9 deletions(-)
>
> --
> 2.34.1
>
>

