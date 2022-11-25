Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyRbP-00008r-Hz
	for mharc-qemu-riscv@gnu.org; Fri, 25 Nov 2022 00:50:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oyRbL-00007t-QQ; Fri, 25 Nov 2022 00:50:16 -0500
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oyRbK-0007Go-BM; Fri, 25 Nov 2022 00:50:15 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id i11so2217624vsr.7;
 Thu, 24 Nov 2022 21:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l6HVFFOmAvTLByx3MS0m/GEV9m5DSYnfvLZ5zbd36Yw=;
 b=YbaNss//xkjgn6vwlRclAcco4ZTmD4lvppFQ4KTWJZWHbdXBO68jvnYcwHhIadgABQ
 uJqhONmkAd3/u3v93qrgDLlCvPM6utkpmCIYjKXq71ip5cyl55JUk2cfOQayBG8dUTbV
 LQz/MHsPf+ZHTWouVj9c4tqBi451aPSjblp3ODkBSNGmd6paUk7+0sXCMY3TBoebhInd
 sPRpTsA+mUjU4SaHo0+x5swLqHdlYiFeceuTcDja9zP3Fk0Mtxt8HPIXbmMKCSOFIzcB
 nUB8Ake8NuOPtiOP5alT2YLQp5ZDJbWpGMXrE9ILr960qitgu7bEvtPXVupzznRcWUv+
 wYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l6HVFFOmAvTLByx3MS0m/GEV9m5DSYnfvLZ5zbd36Yw=;
 b=B4gBQSDc8VZ4qFKUWojyQHvtJLIrY/oEze78dFRuNJABZi5Thd7ckrPyN2cdGQ2jXV
 WxMtmgOvEt2/K91AbtKdeMLZVWCEGO2CF8pbnmOu7RisDDoVbbw/fZuxe3l05aH10YaX
 1VQmCPvUQfqHZsYAeET30DpWyPmHLuOFG0XpKpyRiB7KVtKtoaw5UcrAAdBXJzejLvrt
 0/y9a+OVzx+d82y9ESqhY2WLoglUSYGa6QSxP3W1tKtAA99H9YOppLNSS2Tl7x4NMGD1
 LsCWOSNPHGFruyV2M3S4TNjSViHf7jo7ULFYmssMkfAdQytw3mrQn65Ft1gaDUcE25jr
 LeIw==
X-Gm-Message-State: ANoB5plF1Dsssqgi/2B3vn0hdLn1PCN0m2FKL0PMhdZ2lSfjex+CBmvK
 rxi+KyVgeYAep+ZJ4mPbp/aeg44rUdSQjkQ0+4GP6OkJEog=
X-Google-Smtp-Source: AA0mqf6aZtjWel5dtcJSUmPY7lYhIXMAdMk5owssiQn/IgV5cbNBLHH0wNqsKVbHMdV80QI7AFq9R62X9VZbCkRCldA=
X-Received: by 2002:a05:6102:3bc1:b0:3a7:9b8c:2e4c with SMTP id
 a1-20020a0561023bc100b003a79b8c2e4cmr8981317vsv.72.1669355412051; Thu, 24 Nov
 2022 21:50:12 -0800 (PST)
MIME-Version: 1.0
References: <20221125050354.3166023-1-bmeng@tinylab.org>
In-Reply-To: <20221125050354.3166023-1-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 25 Nov 2022 15:49:45 +1000
Message-ID: <CAKmqyKP+oNAd+jwVFysF5GQaVwvvsmzg3iNb+5s-b6ZP_=BxQA@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Add some comments for sstatus CSR in
 riscv_cpu_dump_state()
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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
X-List-Received-Date: Fri, 25 Nov 2022 05:50:17 -0000

On Fri, Nov 25, 2022 at 3:05 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> sstatus register dump is currently missing in riscv_cpu_dump_state().
> As sstatus is a copy of mstatus, which is described in the priv spec,
> it seems redundant to print the same information twice.
>
> Add some comments for this to let people know this is intentional.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
> Changes in v2:
> - Add some comments for missing sstatus
>
>  target/riscv/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d14e95c9dc..a6c27977c5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -382,6 +382,10 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>              CSR_MHARTID,
>              CSR_MSTATUS,
>              CSR_MSTATUSH,
> +            /*
> +             * CSR_SSTATUS is intentionally omitted here as its value
> +             * can be figured out by looking at CSR_MSTATUS
> +             */
>              CSR_HSTATUS,
>              CSR_VSSTATUS,
>              CSR_MIP,
> --
> 2.34.1
>
>

