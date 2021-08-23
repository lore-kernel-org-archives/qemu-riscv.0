Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mI1FF-0004OJ-TL
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 00:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mI1FD-0004O1-GS; Mon, 23 Aug 2021 00:07:31 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:37386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mI1FB-0005zi-S8; Mon, 23 Aug 2021 00:07:31 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id r4so31548655ybp.4;
 Sun, 22 Aug 2021 21:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZDVr2MwQmyal3VNA5YNftmMIEHaAWMY0qLeI3U/EGmw=;
 b=L6Zvvj+xuNgbDVLKELrEGzuAdlafqjOh5r8MddcETw+bc13u7XoCkp7QDsKJQJkH9f
 VCL+/xKImHIkPPzESLBL0YsQOh3Y7P8X/MOK/UwuBMHdntcq2ksfzfn3awiP8kFRl1Fd
 KSyJdNKVcabDyEu9KuYMTBTL2rnhl16ssMHdupGRRwprdZ6LCcJZGQHoeRaq8AL0eKul
 vqTJxWXXAdWEyxP0y0ZMGL/LUAnxUNLPdDW5iDxmLTpsBga6CM1fkrWl6zBRQFV8wDYq
 9T8SB+0H2tpV1GlcNbKGmuDJXp3UN78cht/KGrdjKPkhw61VsE5JiwX1I10YguAcndhT
 vp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZDVr2MwQmyal3VNA5YNftmMIEHaAWMY0qLeI3U/EGmw=;
 b=sGaneIyO1i2bk1gzj5/GbXlQCDjorxUzPQpWFgyE47C8GVCGHvGH14sA/u/JpfxAQf
 I3OzFHTaAnLnitkB+6ukZoizVWYt6dP4SkFHL9VrIIYjo01khBKFP9cZN6uD6/qBy0ze
 PeMdsyVMkICIuv75TndHpytTePPNsTqDKWUDgVWhyybBMnfTnvaiejV+dEk5pZwTv7uZ
 kUED0rS6fYWETxkmyujtUI/MHpYXXOMIzSi/OJHRO99jTPsgmejpMby2Lyf1Ju1HObZi
 hQtu18SDkIiQTzulms64q2i19XKKhU6uSXvne33OR/1q8Xp+smDhAsw8R0YVJuzLZM6v
 goAg==
X-Gm-Message-State: AOAM5303VFRMDIhWddkjzPB/SaYRDOleWm8hbqaqRapbWk2uDEKDATzw
 zg/1WCgBzuF2n8uklqlkRGCABGRPcnmog4pyGI8=
X-Google-Smtp-Source: ABdhPJy0QeHK/yN1PU3WkjS4neoz3rM4zJO1baIXAto5HhBNMTFvJfoEHaa+ksH09imluUtZUBR3iFNRPPF4WEU6rN8=
X-Received: by 2002:a25:be09:: with SMTP id h9mr43351493ybk.239.1629691648560; 
 Sun, 22 Aug 2021 21:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210820174257.548286-1-richard.henderson@linaro.org>
 <20210820174257.548286-4-richard.henderson@linaro.org>
In-Reply-To: <20210820174257.548286-4-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 23 Aug 2021 12:07:17 +0800
Message-ID: <CAEUhbmUvTQEOXyFzWYrR0yVCPcSpKeoEb0V2PnSs2f7LSGkwuQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/21] target/riscv: Clean up division helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 04:07:32 -0000

On Sat, Aug 21, 2021 at 1:46 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Utilize the condition in the movcond more; this allows some of
> the setcond that were feeding into movcond to be removed.
> Do not write into source1 and source2.  Re-name "condN" to "tempN"
> and use the temporaries for more than holding conditions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c | 160 ++++++++++++++++++++-------------------
>  1 file changed, 84 insertions(+), 76 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

