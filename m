Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpmua-0006FM-HT
	for mharc-qemu-riscv@gnu.org; Thu, 17 Dec 2020 01:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpmuY-0006E4-P6; Thu, 17 Dec 2020 01:37:14 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:40494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpmuK-0004d7-W6; Thu, 17 Dec 2020 01:37:14 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id t13so24769009ybq.7;
 Wed, 16 Dec 2020 22:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IejGwImdgXGfo4CRLBkiW7oBmxaLNq6MwglxguytkXI=;
 b=ZZCKnIz/9E+VnMWTIdCpmRi3prrMudG29pWWJ6AMdTxUIXUTKSN6IAMBkywFTSusQN
 tkYddquNZoi3+sp6rwq3J+nnqpzdU1s2mmn1wNEFA2QaSZbcqfbluFxPlcWjHUDUFQZU
 UTPH0NRTNemWXYmj22UrRDtw+tYN29/2TqRfplDhEMSEzcw0yx0keXTgQmn0C0vsAWJR
 MxZF09+QTRFVGBivFQ1EktclSTq/5dnHPCl4yGPGrUuPRsVGsn5tEy54H7F8Buggvaj5
 VYmCPs6ZULKxLcicVgw3p8L2FgMrYepZhTYaEZKt15g0e3PqUQJJJ/pJIkBjanfNsgZd
 Hb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IejGwImdgXGfo4CRLBkiW7oBmxaLNq6MwglxguytkXI=;
 b=ak3QNloNao03hKSt1EUvKGdq2fWiNbYBjRP30gu7uMF2HHH/P8ikQI/0Pb+Qg6hi/i
 ZLhFbATeDJQsCu0ij68KGqBPd6XzHOxyWhcWWdKiQ3e/VQrZ/wJRjwxnmz5c3B0uk3VC
 nnp3ryghhPibLUtUTXb3dXizI3t6D/2hpitQdaZPXQhOJZMN+GA/P9JLiyryAk4uz2Cj
 7hIuEGa+BtxoGlQ81I3Aeh/Sy6pyx0/1ksMh+KID3pg3XLO72X+nXpIIIkK7Oz3j6/5n
 Oac6gu75hEP7N1Xa/970wZ6Z/qqdSKaGJDUd4YgVSY+PUBy8moxS8RFAJ0rhpWA8e53c
 08tQ==
X-Gm-Message-State: AOAM531j4aj+OWGfbeSRVSqKJDyB2PVTR/8lM0URI47J71IZc8+hOFH3
 xsDgSFKJncwYzG9OnAWGNHz43N2gb6GNk1oDWoY=
X-Google-Smtp-Source: ABdhPJxyjr97DtLRkC04BV88//JZfxW+eCyLniMbTAaNfIRH+jaqfMnrfoFU/MCbJpw+63srZZgnS/LfOIyX1WqWTF4=
X-Received: by 2002:a25:bb50:: with SMTP id b16mr57478720ybk.152.1608187019691; 
 Wed, 16 Dec 2020 22:36:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608142916.git.alistair.francis@wdc.com>
 <872d2dfcd1c7c3914655d677e911b9432eb8f340.1608142916.git.alistair.francis@wdc.com>
In-Reply-To: <872d2dfcd1c7c3914655d677e911b9432eb8f340.1608142916.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 17 Dec 2020 14:36:48 +0800
Message-ID: <CAEUhbmVz_oRw=5vjjvj-UrQdE0VonZcHpQOvwwgJsQTTJdj9jg@mail.gmail.com>
Subject: Re: [PATCH v4 13/16] target/riscv: cpu_helper: Remove compile time
 XLEN checks
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 17 Dec 2020 06:37:15 -0000

On Thu, Dec 17, 2020 at 2:23 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  target/riscv/cpu_helper.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>

