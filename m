Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGd2M-00016N-3S
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 04:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGd2F-00011Z-TP; Thu, 19 Aug 2021 04:04:23 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:35520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGd2B-0005qs-IG; Thu, 19 Aug 2021 04:04:23 -0400
Received: by mail-yb1-xb30.google.com with SMTP id z5so10769321ybj.2;
 Thu, 19 Aug 2021 01:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X2MCy1g6WkhgmXOsDpFItF8xEp90wf+i2LE2ySsUOqI=;
 b=AD0kZL1uZSQyZEJbWCbT7mCck22Kpb66XQdbErLwu6RMsk47rUBOm8/2xiAQ1hDRVh
 s9e/PxJulU0cyxC8SjyFZ6I9eRkidl2aQNfEXv8Iqhw+jITV3JJVNUKKsUKwCUH5hrx8
 4mN8ZMC2FzbDl7FiNtpLVa59JpWZXYo3pQRCPkBXiyALl/apTYmOvIS61h4W4NfJeVci
 wl3RJ3qEOs9M6rsiCD3K1JNcnG0yAzJShArC+1kM/0weDQAzeLXQfrzaY7M74XQpUQWv
 knSnquhtNKr6rCNBCyq5Fndd8Va53JzGr8WChnwcAQXLty5XKLEmiAnAGAWdJyoq/SkM
 gGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X2MCy1g6WkhgmXOsDpFItF8xEp90wf+i2LE2ySsUOqI=;
 b=rrclXmdb0TpxX6IoT8jrKmW4yNAG/Z2KgALYqU/e0HyaemCrKNTlKhsM0lf0hExFKA
 47l88jwq7siN+pRR16j5Ho+4VuL9HJGzsspzQquJAPkRwMZG7xg0IRF74Igq1tjXoq/t
 u6dr12yhH9Wl2nmmUpA8Co5li6E9HJVY5WezqJXO1cr6xY+ffo4/QiAgvOelNMWyBkqq
 /x27XsJJIBMhDCpLZOOyL5AdEbqTgjBNOn7YNEobKvc/GsYe0HunoxsJ5NdDNFHbE8Ze
 pVMOnRhYdf4drwCqtqrzEkByFX5TsAnAvcP5qX47DFCnbEbm6uPRS08BXs/vVynktQVQ
 buNA==
X-Gm-Message-State: AOAM531Pm23/WVo+TpKRb+A24/tlcFoDSvpiDhuBSZXJj7fYR0XZ3jTL
 U0YNXSOTZxEAO65idzBsf29s24ffCPkR05CnTYU=
X-Google-Smtp-Source: ABdhPJy+vivPfuH6dAMwM4Q3SbJMyBtjUU3JhBA/81bgsIbug7ye/BxNaMeOOPON/EMgbx8Vj0cacCcY6YuaG9CHwHo=
X-Received: by 2002:a5b:304:: with SMTP id j4mr16628929ybp.314.1629360257325; 
 Thu, 19 Aug 2021 01:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-19-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-19-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Aug 2021 16:04:06 +0800
Message-ID: <CAEUhbmW6OnJaJivkG13uNJnGJk67HE9rgtELcY6ukoDg3DZykg@mail.gmail.com>
Subject: Re: [PATCH v2 18/21] target/riscv: Use {get,dest}_gpr for RVF
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
X-List-Received-Date: Thu, 19 Aug 2021 08:04:24 -0000

On Wed, Aug 18, 2021 at 5:30 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/insn_trans/trans_rvf.c.inc | 146 ++++++++++++------------
>  1 file changed, 70 insertions(+), 76 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

