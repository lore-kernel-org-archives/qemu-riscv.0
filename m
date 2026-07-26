Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6A3C531F9
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jul 2026 06:55:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wnslv-0001Iq-UF; Sun, 26 Jul 2026 02:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wnslf-0001DZ-Jr
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 02:55:27 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wnsld-0007ww-Vd
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 02:55:23 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-cb20b0a387bso257849a12.0
 for <qemu-riscv@nongnu.org>; Sat, 25 Jul 2026 23:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785048914; x=1785653714; darn=nongnu.org;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=poNx4OEMADHrVJFSdzzYXGPFYjtewrgn/4DHYeOfu2I=;
 b=r9oLg77WtY5Sw8nJVPs22/vXsun82eNmYb7J/vPYMTXTOerqPoMjTTDhHwlVkE6p6b
 BASvUIokmKrvnjkheqwU1EDi7Z7bRzpKaHuqjsWfjf+RF65gNEZyPaLS9UrKhnQFamkA
 Ni/4TPTcBT9Pk3LWNCDpwQjoHnDExmcMATlXR+mCpfRBsl2lBRZPEQ68fLjnFO7XA7Ts
 aZDwFUO3p4SENb8U3ENI9hgZu/fJ7x6iiCM4g/QF3TYrfbqKI5HDRDCQ1J/hyVRbmiBt
 5R6BOanprS+VSgp0RgGWUdplRHKxUre3mWXT9iPeYB58oBMZkkcdtgxnpvJgKiX5adlp
 z/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785048914; x=1785653714;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=poNx4OEMADHrVJFSdzzYXGPFYjtewrgn/4DHYeOfu2I=;
 b=S/NctShyeOh/pq95LX5sLOxXowjfpU3+htd12eM7y0ND8+mD47XI6xqZyYLo3vTGPF
 XUr67PMoSIPc6xQRikDpuh1JUG7z17QGqIWzzhR8OF+98hc7K3V/WlP1pJL6hPzN1832
 ur7VfyvDEZ57n+vGF+tldpXU2lrndChO/cPynDFEJ23ykrZAIefdZ9HLQUNO7nKyCNoT
 nG3yi+utYkryqerRwKD91Lv80FiBwc7HL8brGr1tA3t869CK0EbBhA3FfqOlF+4/DVcN
 bouUdjR0Cay7Dwsj1JVRXMOwImaikBNQ7oIdKElJB7FBUelyU1yDKktXrBHt3EyVYb7A
 Sj6Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RpDs+/vRuJbKMH0rC9jWhiccY04ksu4hzjAC+YuAu+v0KZsQCz9ZV7KqaXDa+6hmZnrpzyvQysUKopp@nongnu.org
X-Gm-Message-State: AOJu0Yw+jWEv1qSipm4mmdIEggsT95y5o5oCSxp+Y4/Z66pnaLZelbkS
 pOuEF9QOV8+ezo+hUE4o7PgMkqmH2tgMPr4P9EKpfulePgAYayEoFXIwbVN0mvobT8Q=
X-Gm-Gg: AR+sD11RmjgTqTpFv3FVIWkS1cBXqk1OfJfsNykiuoExLKIHvOCgpvy4A7dFZ5mabYg
 Nowi5D7awml+lVMrDN302TWAcYkYLBHD+ws+w+hpbckG06GOCEI3RFo0JigGzUOJdmJ3BpIbM1Y
 VhXjNrYQvdwUCDf+f07E8buGNBoF6l3cfHolhj0UaoQi6YBz5UuuBbaE4CKn+Swr/d5FzEsCYqA
 En3yzejk4VGKY4V70T2aMptcPTC0cEir8IgoaINcCli1D7thHW8J3aXKRJnx2S6lGMPxPcsk6D7
 kiNO/hL+VhLSP3YVuIw+T2/6q7W3b/YdADURAIq9fjVVyXzS1rtIl+/8LKjOdkaqUYEZRoigTyU
 qZ37dXG85vn0Gp3GCBOZ/3D5dsJOIUuaQumDM9m9Y6OC4k1+wcJv8gxb/mV+CX04Zl+oPDSgYvV
 ckM7qELfK6AxaIafJVDKCr
X-Received: by 2002:a17:90b:3952:b0:36d:de94:f31 with SMTP id
 98e67ed59e1d1-38f29784889mr3028224a91.7.1785048914291; 
 Sat, 25 Jul 2026 23:55:14 -0700 (PDT)
Received: from DESKTOP-7HME356.localdomain ([38.34.7.236])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-314bc44cb92sm29618246eec.13.2026.07.25.23.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2026 23:55:13 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 6/7] tests/qtest: add test for K230 decomp gzip
From: Junze Cao <caojunze424@gmail.com>
To: Tao Ding <dingtao0430@163.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, farosas@suse.de, lvivier@redhat.com
In-Reply-To: <20260721161335.73872-7-dingtao0430@163.com>
References: <20260721161335.73872-1-dingtao0430@163.com>
 <20260721161335.73872-7-dingtao0430@163.com>
Date: Sun, 26 Jul 2026 14:55:01 +0800
Message-Id: <178504890123.906524.16716266235289264118.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785048904; l=1285;
 i=caojunze424@gmail.com; s=junze-gmail; h=from:subject:message-id;
 bh=3MzUKesDjiW/MLg4jFuf6vDzvj5409nuV7wHjFweBqg=;
 b=BKgS8RvpOleh2a7H8o2CjNZNTO6SVpOY4pTKuex1ZtkqSlBAeLIBiYNpPgfiDRI8HtmC3I6Iq
 YSC1bsy1bKhBpBzALh53Gte4Nf6/tGF6YL1cIdsfCDTxZWOJ38uxlQ3
X-Developer-Key: i=caojunze424@gmail.com; a=ed25519;
 pk=lnFIWNw+6CoDrHFIKUJKdgrRbvgAbQGcEFiVsIigOJ8=
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=caojunze424@gmail.com; helo=mail-pg1-x52a.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, 22 Jul 2026 00:13:34 +0800, Tao Ding <dingtao0430@163.com> wrote:
> diff --git a/tests/qtest/k230-decomp-gzip-test.c b/tests/qtest/k230-decomp-gzip-test.c
> new file mode 100644
> index 0000000000..adddf8f2eb
> --- /dev/null
> +++ b/tests/qtest/k230-decomp-gzip-test.c
> @@ -0,0 +1,181 @@
> [ ... skip 38 lines ... ]
> +}
> +
> +static inline hwaddr k230_sram_addr(hwaddr off)
> +{
> +    return K230_SRAM_BASE + off;
> +}
> +
> +static inline hwaddr k230_sram_input_addr(unsigned int slot)
> +{
> +    return k230_sram_addr(K230_DECOMP_GZIP_SRAM_IN_BASE +
> +                          slot * K230_DECOMP_GZIP_BLOCK_SIZE);
> +}
> +
> +static const uint8_t test_gzip_data[] = {
> +    0x1f, 0x8b, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x02, 0xff, 0xf3, 0x36, 0x32, 0x36, 0x50, 0x48,
> +    0xaf, 0xca, 0x2c, 0x50, 0x28, 0x2e, 0x29, 0x4a,
> +    0x4d, 0xcc, 0xcd, 0xcc, 0x4b, 0x57, 0x28, 0x49,
> +    0x2d, 0x2e, 0xe1, 0xf2, 0x1e, 0x5a, 0x12, 0x00,
> +    0xdb, 0x9d, 0xbc, 0xdd, 0xc8, 0x00, 0x00, 0x00,
> +};

What is the source of the data here? 
Was it extracted from the SDK?
I've noticed that this data is in fixed Huffman format, but the K230 GZIP manual only supports dynamic Huffman format.

-- 
Junze Cao <caojunze424@gmail.com>


