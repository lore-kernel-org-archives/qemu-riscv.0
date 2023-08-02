Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2964C001E0
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 14:46:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRD74-0008VO-Ky; Wed, 02 Aug 2023 10:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qRD72-0008TQ-F8; Wed, 02 Aug 2023 10:46:08 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qRD70-0005qe-W2; Wed, 02 Aug 2023 10:46:08 -0400
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-76d846a4b85so2135795241.1; 
 Wed, 02 Aug 2023 07:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690987565; x=1691592365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1rMFYz74XGzVEvO9Dv24VO/RT0jXMwePPqUugH4AeWY=;
 b=HxrNJqFCzHHxEifu9PHmYFARNRsWvanPynie5iTkBhElC5D1XhJPRMuKM48ur9U8w6
 g0kS0Vg9G6beEcDYgVtIH0Hyuy8YAh3wi1m3f+JDf90Bs8BFOY7+R3laqT4QMOkS2wdi
 7YXCgE3MtO699ram05xkpYHR5BrUaAlPTcS4iArFG1ViFfAvHTzJ1jveldDSL/1yuDPc
 8cTMcrAiOcArD54CtFCMkxcoSsgbwKn7RXdCS9rEGiZGirTMiViCTtg5kVVT1SgCxaDw
 bQ3oaOgE3REXRUKCxY9QHaoaV/xw/84f9VI4q9qISPeV+3tu+u4esU7L0XbFRgQDz9jT
 F14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690987565; x=1691592365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1rMFYz74XGzVEvO9Dv24VO/RT0jXMwePPqUugH4AeWY=;
 b=Ki862xio5AFQDcpKLMbapMVs7RFfxhM8m40ihvSEakjgHMpUw392NhDIl2NZYmogOW
 4fenhI8lFtLeYMS7pHWtWjaon85+w11eKCkhLHMI8dD2OICzXElWbmKVKxx9LwwV4dc3
 7DS0539DqoEz3R2qq5pH0VpgEp1Rh7GPcWSyJP8YsBrNAidIb5x7vq5dn32rWTlm/BdG
 /kzS4BJpSAhQoGROCGwYnO2O4KUv3IIuPa75dXTcPsmf0KHFJlrLvvo2X4v6wKkZWl1Y
 VoPsjUc3ZuybiDgdS1UbtYHa8D0U++VLgmqfCau5RZiJHMWYgl+6p29W0/VovtXwVArN
 5rMg==
X-Gm-Message-State: ABy/qLbsmbajk3U6myCgSAVZoJqA4Kxx/IZ3iL8cTQHHgpI93XgbZ6zv
 h+7D6P5r93ldUwt6EHpBPQ7LpUPPpNUsFJWCJHQ=
X-Google-Smtp-Source: APBJJlEoWsK6FL1pbXOr1k4A0ZYT92GuXT6bkkMSCvYD+B/N9DHU4T3XK0+nWFSvjEjtJwvf5fUeOynlAO++CNlRQFU=
X-Received: by 2002:a67:fe17:0:b0:443:7503:a534 with SMTP id
 l23-20020a67fe17000000b004437503a534mr4974299vsr.16.1690987565222; Wed, 02
 Aug 2023 07:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230711165917.2629866-1-max.chou@sifive.com>
 <20230711165917.2629866-15-max.chou@sifive.com>
In-Reply-To: <20230711165917.2629866-15-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 2 Aug 2023 10:45:39 -0400
Message-ID: <CAKmqyKNNLArT-XsGpPj3y-bD3s--3K8gzpzXOUeSk0Fu2a75Gw@mail.gmail.com>
Subject: Re: [PATCH v8 14/15] crypto: Add SM4 constant parameter CK
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, dbarboza@ventanamicro.com, 
 Frank Chang <frank.chang@sifive.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jul 11, 2023 at 1:01=E2=80=AFPM Max Chou <max.chou@sifive.com> wrot=
e:
>
> Adds sm4_ck constant for use in sm4 cryptography across different targets=
.
>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  crypto/sm4.c         | 10 ++++++++++
>  include/crypto/sm4.h |  1 +
>  2 files changed, 11 insertions(+)
>
> diff --git a/crypto/sm4.c b/crypto/sm4.c
> index 9f0cd452c78..2987306cf7a 100644
> --- a/crypto/sm4.c
> +++ b/crypto/sm4.c
> @@ -47,3 +47,13 @@ uint8_t const sm4_sbox[] =3D {
>      0x79, 0xee, 0x5f, 0x3e, 0xd7, 0xcb, 0x39, 0x48,
>  };
>
> +uint32_t const sm4_ck[] =3D {
> +    0x00070e15, 0x1c232a31, 0x383f464d, 0x545b6269,
> +    0x70777e85, 0x8c939aa1, 0xa8afb6bd, 0xc4cbd2d9,
> +    0xe0e7eef5, 0xfc030a11, 0x181f262d, 0x343b4249,
> +    0x50575e65, 0x6c737a81, 0x888f969d, 0xa4abb2b9,
> +    0xc0c7ced5, 0xdce3eaf1, 0xf8ff060d, 0x141b2229,
> +    0x30373e45, 0x4c535a61, 0x686f767d, 0x848b9299,
> +    0xa0a7aeb5, 0xbcc3cad1, 0xd8dfe6ed, 0xf4fb0209,
> +    0x10171e25, 0x2c333a41, 0x484f565d, 0x646b7279
> +};
> diff --git a/include/crypto/sm4.h b/include/crypto/sm4.h
> index de8245d8a71..382b26d9224 100644
> --- a/include/crypto/sm4.h
> +++ b/include/crypto/sm4.h
> @@ -2,6 +2,7 @@
>  #define QEMU_SM4_H
>
>  extern const uint8_t sm4_sbox[256];
> +extern const uint32_t sm4_ck[32];
>
>  static inline uint32_t sm4_subword(uint32_t word)
>  {
> --
> 2.34.1
>

