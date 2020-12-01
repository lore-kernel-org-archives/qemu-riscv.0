Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kk12J-0003Fs-FW
	for mharc-qemu-riscv@gnu.org; Tue, 01 Dec 2020 03:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1kk12H-0003EZ-MQ
 for qemu-riscv@nongnu.org; Tue, 01 Dec 2020 03:29:21 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:34879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1kk12F-0001YL-VC
 for qemu-riscv@nongnu.org; Tue, 01 Dec 2020 03:29:21 -0500
Received: by mail-wm1-x343.google.com with SMTP id e25so3221070wme.0
 for <qemu-riscv@nongnu.org>; Tue, 01 Dec 2020 00:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:references:mime-version;
 bh=dLxmvSHeayY4n8oHQJrHPbeg+2Pf37O5ZJqkV3gPCVM=;
 b=g+15TZzYSKY30YH1kcse5+yF7pJjCFbokwlsifUbZURIrPqbcBYhFrYfwySv9ylJHH
 R6ETbme7ZwTq4gao/+loY72kKEvNb/58aJX+rvnsmdXv4rw31MAYKy/TDM2ISP6eHuz7
 qLq4SmzQz9eeO7mHOBvQw90PBBbIimJyYmNyeB+4Rp0WxrctmFeub2T8NVW/WI8Zy+Iu
 8w+DlvD8VdHkrxxti0EejR/zhuWaCckCCqQB+DecQ4fzAcrpvjub2QdT/meyJnLg4fbs
 Sw5rKoDORNjRrX8RkacInYXzSwb8wrLQgNrk7Oa/M40psZpr3KaMD6ljVaD8BhiXT2SN
 IiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:references
 :mime-version;
 bh=dLxmvSHeayY4n8oHQJrHPbeg+2Pf37O5ZJqkV3gPCVM=;
 b=Uq6bw5t4YTJheuSxJq7vwUh9J15phbMGiK/CG+/FjPgAZq7turdLtlzIbTTrxcYw8l
 qQEEYK0eYzrYl2LYn7zmDBA3G6vIqoxq6k+DuXfH8P46nw5yGozGgBlrpX2Bd3FFQPe2
 qmdPeHq4Wa4eLwFRuzEb9bXLNEi0BQ37j0Pd2gDM0RxUf9py5+w15FipyNP0Qk8HP91T
 fvGeWq3ZXh3kKakkMLy6HZ5lq3eH8qOuiYRl73y6BuP5roVrB11vjzdGGF3N818NXwgA
 x8EF/k+eEbya0mjLlEvMPICASzADshj68R3TAzcKrzkrLGrD8pVvHFNYUJ3brcAKQTw1
 zQMw==
X-Gm-Message-State: AOAM531Q3fZfVKq5fnu5crIN/d2G74P//+bWEILhHITRaStOOrS2oKPz
 2x87v5GC4E3/qhnC3u2bzQmSU4Ez/TkrvBjx
X-Google-Smtp-Source: ABdhPJzlnx6RcRw/9Z7T8EOGsPw9c2PxUbF+/B4OoTXBkwltGQqgYudM6atHMklPDvjMMC7t0QdXZA==
X-Received: by 2002:a1c:4c11:: with SMTP id z17mr1502978wmf.13.1606811357831; 
 Tue, 01 Dec 2020 00:29:17 -0800 (PST)
Received: from [192.168.2.1] (net.iroazh.eu. [109.190.73.171])
 by smtp.gmail.com with ESMTPSA id w21sm1551037wmi.29.2020.12.01.00.29.16
 for <qemu-riscv@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Dec 2020 00:29:17 -0800 (PST)
From: "Emmanuel Blot" <emmanuel.blot@sifive.com>
To: qemu-riscv@nongnu.org
Subject: Fwd: [PATCH 0/2] Fix PLIC issues
Date: Tue, 01 Dec 2020 09:29:15 +0100
X-Mailer: MailMate (1.13.2r5673)
Message-ID: <AFB0EE63-BDB7-4E5B-B670-1E5B95F24234@sifive.com>
References: <20201103152920.90957-1-emmanuel.blot@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; markup=markdown
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=emmanuel.blot@sifive.com; helo=mail-wm1-x343.google.com
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
X-List-Received-Date: Tue, 01 Dec 2020 08:29:21 -0000

ping

Forwarded message:

> From: Emmanuel Blot <emmanuel.blot@sifive.com>
> To: qemu-riscv@nongnu.org
> Cc: Emmanuel Blot <emmanuel.blot@sifive.com>
> Subject: [PATCH 0/2] Fix PLIC issues
> Date: Tue,  3 Nov 2020 16:29:17 +0100
>
> PLIC may trigger a buffer overflow when the highest IRQ source is 
> signalled.
> IRQ0 being treated as "non-existent" IRQ, N+1 slot should be allocated 
> and
> handled.
>
> Emmanuel Blot (2):
>   hw/riscv: plic: Fix highest IRQ source slot
>   hw/riscv: plic: Make IRQ slot 0 part of the IRQ priority array
>
>  hw/intc/sifive_plic.c              | 27 +++++++++++++++------------
>  include/hw/riscv/microchip_pfsoc.h |  2 +-
>  include/hw/riscv/sifive_e.h        |  2 +-
>  include/hw/riscv/sifive_u.h        |  2 +-
>  include/hw/riscv/virt.h            |  2 +-
>  5 files changed, 19 insertions(+), 16 deletions(-)
>
> -- 
> 2.28.0

