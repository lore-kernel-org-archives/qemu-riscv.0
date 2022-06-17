Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1zUf-0002fW-PC
	for mharc-qemu-riscv@gnu.org; Thu, 16 Jun 2022 20:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1zUd-0002du-GG; Thu, 16 Jun 2022 20:05:43 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:44768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1zUb-0004bl-RG; Thu, 16 Jun 2022 20:05:43 -0400
Received: by mail-pg1-x534.google.com with SMTP id 31so2617993pgv.11;
 Thu, 16 Jun 2022 17:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oeQcIZIt0eVdrGIbnD98QCkUXR6a5+m4Q/BzRTq/WY4=;
 b=YqKe0jXndiYCy7RNzwGg9mhBaOJTdI4L4gMiIEKwKeDy0PX73raM2GnQHh4pCFppdX
 yj+COk0iCzuFsTo9aeJeopQAy+A+pr5Dy613IkppRmut3ncmwVWUygJVf1OoUbZVckmS
 /IOSNXVxCSd8V625yTC4PAl10u3E7lFtDvu8c+O0S6rmBbsJaa5ARAjQLHs4Sdq0P4pB
 2Z4GK7j/mC7URt1coiBKoB0qsSVlLAsr9FrBp3B9Mrwrdy+7WW9lKsUU2MAOQSM3B3hj
 aKSWo1ZMnqkegWtZwSJsK8NjUoiSuMrRcys1yAP+cQ1YAZQbNLt8WCJ2Exc73vRiYkNl
 mCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oeQcIZIt0eVdrGIbnD98QCkUXR6a5+m4Q/BzRTq/WY4=;
 b=RwbP12qL0qn7APG7ocbmNTzL94GA2l0yuvGxe0vCDaUiemWvQlZtHVREiDPHoqLCms
 QcxafqGHhZu98Y/Eu8g6FxDYhZeRT3PNiwQazdS9HQBZYn7UZN/FWeQz811nedWH/1JK
 JwRQF5X0Ee/Wv6YvpLoTC7yMqIJZLM402rnfpCdxQ173sWohzZPDZK1De5jWHF3N454j
 0ZkP+o/XZL1quoRHS/MGCYFIqOEms2p9LUVnF746KMH9tJQhiv71n8vG/dQjTnEEhOhX
 f1cmY9hapNNQPzezioVijfeEJCrOECYsMTL8TpVH5eEVEUqn35wdiQqQja95yjV6XMuv
 f7zQ==
X-Gm-Message-State: AJIora929YfvSPrJoMTO5KfSLAnYs6BCrcFJKE8YV8uI/PwBUf3l8oFt
 SSka56MhaocgSQ8IegLrWdb45QqSCtz4X0uObQg=
X-Google-Smtp-Source: AGRyM1tUQM5xsIEYYAXu+ijvZ4UHSlwt6HwvdSVIWb8WNbxqXJNNsl1PsxpILo62NxJyxfwi1qTEIPK54bk+lQGHCUw=
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id
 d10-20020a656b8a000000b003db7dc5fec2mr6458069pgw.223.1655424339932; Thu, 16
 Jun 2022 17:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <3oq0sqs1-67o0-145-5n1s-453o118804q@syhkavp.arg>
In-Reply-To: <3oq0sqs1-67o0-145-5n1s-453o118804q@syhkavp.arg>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 Jun 2022 10:05:13 +1000
Message-ID: <CAKmqyKPVdJ-tJYqisj1Lw=0=LTcGcSvmZ+AA5XVuwiJ9eEpTog@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/pmp: guard against PMP ranges with a
 negative size
To: Nicolas Pitre <nico@fluxnic.net>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x534.google.com
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
X-List-Received-Date: Fri, 17 Jun 2022 00:05:44 -0000

On Thu, Jun 16, 2022 at 7:12 AM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> For a TOR entry to match, the stard address must be lower than the end
> address. Normally this is always the case, but correct code might still
> run into the following scenario:
>
> Initial state:
>
>         pmpaddr3 = 0x2000       pmp3cfg = OFF
>         pmpaddr4 = 0x3000       pmp4cfg = TOR
>
> Execution:
>
>         1. write 0x40ff to pmpaddr3
>         2. write 0x32ff to pmpaddr4
>         3. set pmp3cfg to NAPOT with a read-modify-write on pmpcfg0
>         4. set pmp4cfg to NAPOT with a read-modify-write on pmpcfg1
>
> When (2) is emulated, a call to pmp_update_rule() creates a negative
> range for pmp4 as pmp4cfg is still set to TOR. And when (3) is emulated,
> a call to tlb_flush() is performed, causing pmp_get_tlb_size() to return
> a very creatively large TLB size for pmp4. This, in turn, may result in
> accesses to non-existent/unitialized memory regions and a fault, so that
> (4) ends up never being executed.
>
> This is in m-mode with MPRV unset, meaning that unlocked PMP entries
> should have no effect. Therefore such a behavior based on PMP content
> is very unexpected.
>
> Make sure no negative PMP range can be created, whether explicitly by
> the emulated code or implicitly like the above.
>
> Signed-off-by: Nicolas Pitre <nico@fluxnic.net>

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 151da3fa08..ea2b67d947 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -167,6 +167,9 @@ void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index)
>      case PMP_AMATCH_TOR:
>          sa = prev_addr << 2; /* shift up from [xx:0] to [xx+2:2] */
>          ea = (this_addr << 2) - 1u;
> +        if (sa > ea) {
> +            sa = ea = 0u;
> +        }
>          break;
>
>      case PMP_AMATCH_NA4:
>

