Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWaS8-0000xb-4W
	for mharc-qemu-riscv@gnu.org; Wed, 14 Apr 2021 04:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWaRn-0000le-Ur; Wed, 14 Apr 2021 04:00:37 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:43886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWaRd-0001yw-J1; Wed, 14 Apr 2021 04:00:26 -0400
Received: by mail-yb1-xb34.google.com with SMTP id o10so21135917ybb.10;
 Wed, 14 Apr 2021 01:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0j3y/bFaM0zrZwVCzkfLgTHVqAFRciP44xeGMStGkHk=;
 b=TvSQxxRGEh0FjyP4wI2fM/PXMAC36ePS/o6D267KDsGb5j0XdJjq4FmW4Fr+C05XEX
 ddRVDH19asRr7/ONkckXOSM6H/NZ7fZUeWNDFVA3WqEEq0KipEerG7ZMUHjVI9UDeHQg
 fV1stTD13ozPsEvpNDSAJ8KJHDchDoH7IRcfyy34QkHFltoNomcakzAPXxYXmAKkd+8n
 6ND00VuZ+Bk9KbxKDO3mc8K3C3A0QSKapSbBB4uD+AMif/FETVFugoIm7nnN6Q4xn9TL
 w1WIy/h8x9XM0BGMp/3S9onWw/VWr9sqbBFwIz+YMmRRM3yOVVXkV1+EFHkGAYilGpIm
 GrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0j3y/bFaM0zrZwVCzkfLgTHVqAFRciP44xeGMStGkHk=;
 b=bjurvwamBepfxXcinpMkrArwtoa7IANLVQrjH6svLV1JA6ET8YTJGTdu4+q9JwNKcS
 9LUSb9F9PA54dAhXGvu9CBqJjgny1szyhQIuXKfVVeby1kN3TFLYPmVP24g5zF1a3wjL
 ba8gp8MJrJ/A0u8tMsk9RrI+1ZfkBhTcgpmuK9yAww1bQbwDru0S2c3qq2q36ZGAbNz8
 udYis806GKF9KO95S0KXcipkazs+5vT70IRGgRVFMWJNbJ7OZ7+Ddi/+P4Ht6GCA+cbI
 G2Pu9aIKO7o3JmnNCzegRAGnCdfcwqn6YaNu5E+tq9kDt2PaZXbchBlSaWXCH9vZLNYC
 xtTw==
X-Gm-Message-State: AOAM530jERc+sY2njTE7TndyNotSSd3tz3s9rhSP0Tw5s2nTDWPtVTAO
 3rpaGkOpQPmwdAaGdgwPOfBa7ZoCeFV6FOGlOKQ=
X-Google-Smtp-Source: ABdhPJwgkyUOOOcVdXYZVCO0co8yLDodnN3ASzZGciRodbTqHQszKG3HupltGpC8q33z6EQ8kf+0Pwrh6b6mUyyX1cA=
X-Received: by 2002:a25:be09:: with SMTP id h9mr23205305ybk.239.1618387216408; 
 Wed, 14 Apr 2021 01:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618356725.git.alistair.francis@wdc.com>
 <712a346091f1559c50c7f9b334a8dec728cfa2bd.1618356725.git.alistair.francis@wdc.com>
In-Reply-To: <712a346091f1559c50c7f9b334a8dec728cfa2bd.1618356725.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Apr 2021 16:00:04 +0800
Message-ID: <CAEUhbmUnjXXJvAmN9EmLmePEP+wVxm+9GFvjLfm7YmkwUgwzGw@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] target/riscv: Remove the unused HSTATUS_WPRI macro
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 14 Apr 2021 08:00:46 -0000

On Wed, Apr 14, 2021 at 7:34 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/cpu_bits.h | 6 ------
>  1 file changed, 6 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

