Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nL6yq-0003lJ-TN
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 12:23:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL6yj-0003kj-JG
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 12:23:35 -0500
Received: from [2607:f8b0:4864:20::b2e] (port=45052
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL6yV-0004PL-F5
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 12:23:20 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id g201so38328ybf.11
 for <qemu-riscv@nongnu.org>; Fri, 18 Feb 2022 09:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tvmE9xhwZhb9FM3CbnTka50hsOAYwBTZ7MJapqnkBU0=;
 b=LJkY+R6MgMI+us5Vjjmqjg3+vhcS8qXVGd/kI8nn+UokYuXQwkH9kEwIeeSeUWegUq
 8GDbHdcHS6Vw19x1qTmgMQFRkXP+69xCrN3hlo5zsxLOfXiWdhSsCOv5h6xh6dGMihL8
 AKqYU+HtNAMsn7ekpMTjeBhrxsbHpAG+iCufTpx/T8IacWFMIdHVfFzYss8DZnGdhsjG
 M24vNetTSeBelndiTvwg1ep2GIHPiQGWAYZfgSG7S88iQw46E2LOCVieADbTYIwaFTBo
 PuD1/ifLK+ns1XgRqk4bP79+CKfe2A1FbUOZZacnHmMHZGGQqtyKzmjSu2XbKejDMGer
 am3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tvmE9xhwZhb9FM3CbnTka50hsOAYwBTZ7MJapqnkBU0=;
 b=3ZNHH0BL2k5S4LRaG1VWFdKDconPuMzX9PIZl42m8h+B+PliY7Nf0PpsS4dqRQXlPN
 252OYkD9tByfMwmLT4Uuj8nvp/FxjGYNZUjxZIGoi1UeC712L54Ceyb4NUIif/oMqZgH
 EyWrISI/fExDs8K/5BrE5UkdL2PdW62aatP+Dm1yJMTRihDQOHOx+c7YsjCLrYiFQhHP
 DKiKStTNSLOcCJtYZXFs5nxySuXnyKfdny94KPTRlHMfnSLiCRCVr7hHPOzZ/NIXULSZ
 f3Exoeu53HLsUGzgma9TLYUjlv8r3LIaEKfCUTBlyoYz8wmxnSWjmQ+b2CcpLO2RCmnJ
 iRUQ==
X-Gm-Message-State: AOAM532dDQczEq+MYehwRifhPhYu7azbfmOjcK3+Dkp4WLv/RYGnCpVF
 hz7JmC9QnI1Ad7Dzs8mpO+CiuA3mXklUCt+ggeaOag==
X-Google-Smtp-Source: ABdhPJwebUhM16X2JAdDF6tCik+08LtWHPIosvMcE5Ug5OJ6P+5c6SezDQ3GwcsOEOOmG2aCDxcB5+L2MR1ab+zDfrw=
X-Received: by 2002:a25:69c4:0:b0:624:4ee4:a142 with SMTP id
 e187-20020a2569c4000000b006244ee4a142mr2315049ybc.85.1645204998372; Fri, 18
 Feb 2022 09:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20220218164646.132112-1-damien.hedde@greensocs.com>
 <20220218164646.132112-2-damien.hedde@greensocs.com>
In-Reply-To: <20220218164646.132112-2-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 17:23:07 +0000
Message-ID: <CAFEAcA_xtf-LtvhNqxMEtZs1Z6NePkVKOp6Kh+tN_HZTkFiuTQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/riscv/riscv_hart: free the harts array when the
 object is finalized
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 18 Feb 2022 17:23:35 -0000

On Fri, 18 Feb 2022 at 16:53, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> The array is dynamically allocated by realize() depending on the
> number of harts.
>
> This clean-up removes memory leaks which would happen in the
> 'init->finalize' life-cycle use-case (happening when user creation
> is allowed).

If the allocation happens in realize, then it won't hapen
in an init->finalize cycle, only in init->realize->unrealize->finalize...

-- PMM

