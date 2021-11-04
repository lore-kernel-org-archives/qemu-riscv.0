Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mibFk-0002Mu-QC
	for mharc-qemu-riscv@gnu.org; Thu, 04 Nov 2021 07:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mibFh-0002Jv-Rw; Thu, 04 Nov 2021 07:49:53 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:43825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mibFX-0005Lh-Du; Thu, 04 Nov 2021 07:49:53 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id a129so13756172yba.10;
 Thu, 04 Nov 2021 04:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QZei2oHitkxQlyFmReJWNQcyb0PAU68D3PALDg+TW5c=;
 b=Rnjq+nLDfKrJqPLGZ+3SKwRlceq2YvK8Hp4gvkaVnmGnrrNdj9ubn7rQfAnn56ymMc
 RYzWGkUrgcO2oFn1nTPrRJ0gIbt1cSvBl/x7vXBXYykQXkbX/gNtblf8s3vuqH+dgp5J
 LifEd2XafmeyZQz6Y7y5oqKQaHIib4OhfaB3gox3upMJTTzNJusgnArSjTLSDj3dp9ij
 HgWboZyabRSr1V0symOU6WeUEfA/aelDJJcyhDMR85i4/N6l4c2eYFB+8LonStxdTR5h
 bRSiclTe/yox/YYErletMscDZT8nWd00+ac/2MbZIb2L1QyNtYg5RtFbi9cPozlr7vb7
 18hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QZei2oHitkxQlyFmReJWNQcyb0PAU68D3PALDg+TW5c=;
 b=j/eLlDf1hvp9SAp10x30RUCHvI4pzIrPE5FqcDHEQXRkkFUR3Rkl9r76VcqJGXohP3
 bfeUoo8n7km3E/pTfRXGYlBvx7xkU/+2cVUdcY1TkftVsqVOQOYOJpmSeruKRv1DgRW2
 if17Qo5MFLeFbdVv/XiS2stszNERsaMF7ePVHpawMxf6hSvv0aejlRt8ktUPOT3Dcrt2
 /WPCq4DKhKEHJdwEba+ti+eJ7dk7D0iPqOTOyX1iMD8BBiCeMCJ7d5KGXiIEF556WPP3
 /Hr4IDB6KGhzyqerOFrZEzAakLM1OQcZMZAMOmYG5kBIo8g8c2Aq/FBjqZnqWC5WuCzB
 Jsww==
X-Gm-Message-State: AOAM533Tl5hWRV+LELqeL4ZsVSsgq/h1stc1K21QMPeqnSeHCOWQxUAd
 DA0t9wLVuhbgBUc1x0DYajXWzma5UAixgnV3rG4g4yyomto=
X-Google-Smtp-Source: ABdhPJw33Kz46I/VdPBIi5Kga+eB0bD9NfWx7GQDzxE7jB5chXNwMKH3s3TtzOp0uuWP0PdfjREWFmhvchlLv19ds64=
X-Received: by 2002:a25:11ca:: with SMTP id 193mr52205706ybr.453.1636026581976; 
 Thu, 04 Nov 2021 04:49:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211025195601.245631-1-atish.patra@wdc.com>
 <20211025195601.245631-6-atish.patra@wdc.com>
In-Reply-To: <20211025195601.245631-6-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 4 Nov 2021 19:49:30 +0800
Message-ID: <CAEUhbmUzzHGK44AFnyyFcVePYuY0XB4vEWi+5RAB0SBhdO2ejg@mail.gmail.com>
Subject: Re: [ PATCH v3 05/10] target/riscv: Implement mcountinhibit CSR
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 04 Nov 2021 11:49:54 -0000

On Tue, Oct 26, 2021 at 4:05 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> As per the privilege specification v1.11, mcountinhibit allows to start/stop
> a pmu counter selectively.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  target/riscv/cpu.h      |  2 ++
>  target/riscv/cpu_bits.h |  4 ++++
>  target/riscv/csr.c      | 25 +++++++++++++++++++++++++
>  target/riscv/machine.c  |  5 +++--
>  4 files changed, 34 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

