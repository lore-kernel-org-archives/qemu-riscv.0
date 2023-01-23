Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK6QK-0007dd-0A
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 18:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6QI-0007dP-JW; Mon, 23 Jan 2023 18:40:22 -0500
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6QF-0006Yp-MK; Mon, 23 Jan 2023 18:40:22 -0500
Received: by mail-vs1-xe31.google.com with SMTP id 3so14781264vsq.7;
 Mon, 23 Jan 2023 15:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n3n5HxNfYhf0/SezKNMAnLkuP5Vy3jO6pDo9v+Bf7pQ=;
 b=KolFkNUXRlgZwvSHbqZnVqc4wXGwOEj4XR6TrGXaZb7ilxxotS1OdHC/s//621PRNH
 lOECUVlx4+FcGwUSUj+7+b5JBVOIjiCUXoHjZeUFgdCbI5x0/Jruapgf8ozwluAnxuO7
 oJsuiXhY6P4FpT6h8R4b0niLz4x4Y/ZO5nRpq5SG6pVpiOmo1gWwA/ywMgdblGC8iPiY
 eoHDjqA6fgX2/NwGyoPFrPxD4hXLA56ubyJwMu5VIk5mUF/OVZ7sxCoKOop2AZHHvfdA
 stPxB+9zgU41soyuJLETM08OAH8NC9PGysPtEoaljUSak8uYeAfXSXte+/2iJ1DlOvx/
 GkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n3n5HxNfYhf0/SezKNMAnLkuP5Vy3jO6pDo9v+Bf7pQ=;
 b=F5RVJlPoAAxj1fQMVZ+1AdGiq+C0nfZkajaPImDLOqmoVrcAjtGN8+f+yg8aPItOKX
 Nv+bLcHTY1GxYeVHe1Mcsqqpj08w5i+1hH31+z9A9nfH9mOCV+DizPt0qTn//vktR6f7
 8CBZ+pEgkSU2D2LZNu2yun0tpfZepHa63msW0KFnd44WAz6869POewIuP1XbsiH4PzPK
 i8+S5ZDQhHFXvSWokils8JBE1NIvKDuYKmfpr6d8o2HZwl7X2Uav6wEf+GkXy4T5fN90
 dcppT8koYYST0htB4KKoZluHPGL5yh81gTrD8T7SB+eLk6S7Wd+ho21B8qHiMqYM0ggx
 XhDw==
X-Gm-Message-State: AFqh2kpDw2YviL7DTDyhUhPRULkYodE2JzA6eLhTXVelbqDLTi1whYFd
 mKi6zx/ba6AhUDzh6hQoDeU17tiNZtIpiQNVifI=
X-Google-Smtp-Source: AMrXdXuxnu8O4yPFFOtshQEUMrIUNy7J8dAFPp6kwSVfKPj9MSE3QJXypEWMISIn2Nnc0XBXGBFSlWVpt++kGwXr1ys=
X-Received: by 2002:a67:ba0c:0:b0:3ce:f2da:96a with SMTP id
 l12-20020a67ba0c000000b003cef2da096amr3070953vsn.64.1674517215862; Mon, 23
 Jan 2023 15:40:15 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-13-christoph.muellner@vrull.eu>
In-Reply-To: <20221223180016.2068508-13-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 09:39:49 +1000
Message-ID: <CAKmqyKMUZDUHN3P1WMtv6jvthJ+P8A4M4sw=Atpts=00Z7EevA@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] RISC-V: Set minimum priv version for Zfh to 1.11
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>, 
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>, 
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 23:40:22 -0000

On Sat, Dec 24, 2022 at 4:07 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> There are no differences for floating point instructions in priv version =
1.11
> and 1.12. There is also no dependency for Zfh to priv version 1.12.
> Therefore allow Zfh to be enabled for priv version 1.11.
>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index bb310755b1..a38127365e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -76,7 +76,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
>      ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei)=
,
>      ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihin=
tpause),
> -    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_12_0, ext_zfh),
> +    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_11_0, ext_zfh),
>      ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
>      ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
>      ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
> --
> 2.38.1
>
>

