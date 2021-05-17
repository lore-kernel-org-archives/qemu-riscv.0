Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lic4k-0003qk-N1
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 08:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lic4c-0003j1-5l; Mon, 17 May 2021 08:10:14 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:37653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lic4Z-0002m1-EI; Mon, 17 May 2021 08:10:13 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id b13so6813287ybk.4;
 Mon, 17 May 2021 05:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TTMX92ThkZi1b50KEZ641MSphuPX9+e/CHcmKvDSzr8=;
 b=Mw5YDE/R/eapm9eldH+eDBjLLCCu73oW2swQoqm6cop0uePmFoEMJgOz8v4CzblZzL
 3JmLzco72JJcFXNKq3aHbRflKfVYgu4vKrOsmP1itsqPsCFzOxUXEpDQSE9/B46eefun
 SO4RgAFK1Jiav6l161lnsbW5K2isFFZiSCJwjjM7o+HJICvYPI7woJkN/KwbkIvz59Wj
 YT/dqwpxA3iq58QZOCZBfLDqdAn/2LO1B+J6eWlWTe2aPTSQ5wL6AaMYdy6WpmLq9q86
 RbxzrBRi7bI9s29Vw6xEyFiNkJRHdFBR3IJXlf9s/KXCQmfpTsqcFN44U3d4H8RV7E1W
 CfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TTMX92ThkZi1b50KEZ641MSphuPX9+e/CHcmKvDSzr8=;
 b=To8qZBCUTo0sORyOgSmWCQRTLCVcd+bEJKOx59s4TJh8XQe7n6LnUIkFu9Wyv1GBs2
 N0FAdUxlU30GYfFjKp5FYgRUAV3VD3W7Q2cW8wFRogoKRLMUBhzE+0163jGLDMEzqBDW
 46lpI81jxr0zsvsrwK+sslHIGA6wBz5sQOWEJkCW6Gtzj10u0Xhk3fRbC4eFs8qEqUil
 E2ObZlMRwIQhsqKSKUpv8LaCher/3wi38zdZxqRNNIi8WaTgS4nhl9OK3drHV7Ol3S4D
 m7EHJn1s9chFt2cHX4l2gbeJmTImCgPT4nkv+xy7Gmj/NtQb4saZd4MfwrU9UtYbvnJc
 pZAg==
X-Gm-Message-State: AOAM533SScXUavtvBJjiQvR61s1rvQo+WhKImroJBlaTT0NPe9UX/KB2
 l+xRq5URj43Bzlcdz0fm0gYqQ1TsDd3NFcFZJ1Y=
X-Google-Smtp-Source: ABdhPJxB0QF1Da1kH6DCjbczS+cgbb/6oKAk481smyDiwqrPAeHbTk11fGmo9FaIhgdX2d1nKEPvsh9+x32VPFLnUKo=
X-Received: by 2002:a25:99c1:: with SMTP id q1mr79110372ybo.517.1621253409707; 
 Mon, 17 May 2021 05:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210517070851.857841-1-f4bug@amsat.org>
In-Reply-To: <20210517070851.857841-1-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 May 2021 20:09:59 +0800
Message-ID: <CAEUhbmVQir88gewKdk6myPHMxKx49q0HSYhLZFE+uYkHioEJ=Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Remove obsolete 'CPU unmigratable' comment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 17 May 2021 12:10:16 -0000

On Mon, May 17, 2021 at 3:08 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> The RISCV CPU is migratable since commit f7697f0e629
> ("target/riscv: Add basic vmstate description of CPU"),
> so remove an obsolete comment which is now incorrect.
>
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/riscv/cpu.c | 1 -
>  1 file changed, 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

