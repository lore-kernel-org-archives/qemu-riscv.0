Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432C9606CF95
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lPoLNZRZ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xP01P-0007KN-4S; Thu, 05 Nov 2026 11:09:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xP01E-0007JL-H0
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 11:08:56 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xP01B-0005od-Ic
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 11:08:52 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a215e64962so19721205e9.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 08:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793894928; x=1794499728; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=x0FCzfv9OYMEwCNlqdVnHJj1JgfOczdas0r9ze3o/f0=;
 b=lPoLNZRZkof3h0at6015NZh31bMwsij4yABe/qFM25TUmN6S7q6QBXYG7ww5aTWQHy
 8SkQf8MVE47rJk7k4WlP2M/mkLjdRtG5CXMX7wJCGQ+kfiRV50xENrf32whC1oRl1FsM
 IOIxVpPGFhScwUFnRek/7PQQwZ47iRbvKHVod2iQdbRFqNlVHzjjkOquOvdEvOCM8DTA
 U94EIVayyvH9s1Xso/kmFALOw3zdaifWRn+6QCNsexhnm6RThVFV0gmyp6E2knb/54pt
 XzS5zW0w00OIdz+Dwwtfs3qm4uakP+nsiULPwEhSg+8uqqT2UuDvCBOQD0fuhfmKT/y4
 wJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793894928; x=1794499728;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=x0FCzfv9OYMEwCNlqdVnHJj1JgfOczdas0r9ze3o/f0=;
 b=fXFs//exy25zoBN3ti+AwLEpeKX7c6IYvTiM69H1/f9DdHzyAqYdr/jkWWMsKAlmBg
 OyYdNLOVnhKXsuVoScqbQxTAhS31MJoXiI/RpiZtVKnOu4UWKMi0Cvv9vcOXXaZSBHnX
 RW8OfOLW+S0ZJP5KFeeGhdKyIq2VWgrMDPOygadRbZ9h5IE6dTzVGzQPE0lXd0UXbPws
 BjBkr4REvt68jLgu/5dBKGCCUBXqgufU/TdebZuFpuhAox597RR9NHa+9eIcncoEYKHN
 zEeS3E7liI2ELnei0nCcfSQpafMiVCkv4LqbKR4RRNwjxod9pBkMLi8Dj3uG1z7cMKRx
 irHQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzvDI7hmyUAit4oZnUPKEcA1o4u7/G7CGIXEZap65qs08vYrEJ6fUpEjqWu9/Q9hFZHLUYXKqev0OMP@nongnu.org
X-Gm-Message-State: APuU4Z8zJPlaFtQdjUypv0OfFvqHcSafiLanvZbyC2k6AIlEc7truny0
 MbHwVSHqmqK05dZOEEQD04lTfleuCxbMMCw3GKko8+K/x+Vqax+TSzauGVwcLFqumWQ=
X-Gm-Gg: AYBFou0MBW/1lXh6zriDWpiEnYsEiLgrFenA6z7f0/NuiXuCyMorbfwixBiWuJwpmWl
 4AZPITCExWErJ8QE0lMG6620LeSg0myR5Zi6zBLbcXZP3On3kqt9Rh173hkBl5WLUHZh3ryrlLh
 mdXONCzO09nLE2DBuoXsBmu1/3d84kQFQ/oLnKXRrhY3V3mq9M7rx3uL6JHkdyfdKToSISwcFzy
 6Yhmyge4t/asbhniahwWQbw3UTZwoT8CyLR0ugkiTdsXHT476WjfWXk/hrwGQPNTpU1RT+HMDUP
 /nxmOaVJcNTm1PpP86qGjRSxNagglTXFqVZnbtfQPshL6TKmicGy1JyhPk8YzN82NXZprWsdmY+
 i4J/XDzGA/28UcBAN5U15QnTuv+4xVy0maRlrsMVsTkYYnksLFnJPvq/tNE9AOaF1VCcanBIJdi
 ciyiFOcriSdhe0ONS85H8+gT+63buX9ZOrnyW84OLZ6MIpCwx8VE8LfxKhIyOvz2qvhhdLXKPvV
 Foi8alRSe46lceTZNlBuOMhDmlgvjG2IuUHyg+Up83yhkQxPYsvvpgpPG9hN0702+/oI5CQ/4TQ
 mUTivGqsZIMrzDogzFiUk5gBt0cP
X-Received: by 2002:a05:600c:474a:b0:4b5:d95c:2378 with SMTP id
 5b1f17b1804b1-4b5d95c241cmr41902635e9.34.1793894927605; 
 Thu, 05 Nov 2026 08:08:47 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b57317cae5sm115414155e9.12.2026.11.05.08.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 08:08:46 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E0C235F8AF;
 Thu, 05 Nov 2026 16:08:45 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org,  Nicholas Piggin <npiggin@gmail.com>,  Harsh Prateek
 Bora <harshpb@linux.ibm.com>,  Amit Machhiwal <amachhiw@linux.ibm.com>
Subject: Re: [PATCH v2 09/17] hw/ppc/spapr: Replace deprecated sprintf()
 with g_strdup_printf()
In-Reply-To: <20261105125203.40320-10-philmd@oss.qualcomm.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 5 Nov 2026 13:51:54
 +0100")
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-10-philmd@oss.qualcomm.com>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Thu, 05 Nov 2026 16:08:45 +0000
Message-ID: <8733tf6z1u.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com> writes:

> Replace sprintf() by safer g_strdup_printf() to format the
> node name, silencing -Wdeprecated-declarations produced
> by Apple clang 17.0.0.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  hw/ppc/spapr.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 54e3cc3cbe42..6f1a046a425d 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -352,14 +352,13 @@ static void add_str(GString *s, const gchar *s1)
>  static int spapr_dt_memory_node(SpaprMachineState *spapr, void *fdt, int=
 nodeid,
>                                  hwaddr start, hwaddr size)
>  {
> -    char mem_name[32];
> +    g_autofree char *mem_name =3D g_strdup_printf("memory@%" HWADDR_PRIx=
, start);
>      uint64_t mem_reg_property[2];
>      int off;
>=20=20
>      mem_reg_property[0] =3D cpu_to_be64(start);
>      mem_reg_property[1] =3D cpu_to_be64(size);
>=20=20
> -    sprintf(mem_name, "memory@%" HWADDR_PRIx, start);

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>      off =3D fdt_add_subnode(fdt, 0, mem_name);

fun fact, ppc seems to be one of the arches that mixes fdt_add_subnode
with qemu_fdt_add_subnode.

>      _FDT(off);
>      _FDT((fdt_setprop_string(fdt, off, "device_type", "memory")));

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

