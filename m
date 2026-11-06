Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26713606A329
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 16:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E+z0Wq5h
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xPMOy-0003x7-PF; Fri, 06 Nov 2026 11:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPMOc-0003uz-KP
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 11:02:32 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPMOa-00023c-L6
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 11:02:29 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8b0db268bd8so5512097b3.1
 for <qemu-riscv@nongnu.org>; Fri, 06 Nov 2026 08:02:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793980944; cv=none;
 d=google.com; s=arc-20260327;
 b=ZkLn1JDO4xA0fvOOXdq7LuL2KTanbf17E5t95TTiCZRPsT+7TlkdtpTxaWiTPCytTM
 Zs3o1I79tV6paIXVUvTX46FyvRe5auNlhvTcKvudHuKW4OIVTr11w1UP2dHYktjZI3HD
 TSdiuvq+WRa2MTTfjEObGixQ58OkDJC3sTj6mMv4aYLJYSm46OBni52etgOPIib/jp3W
 g3Di7rywqeJdc2jFvTQ0ZHvApq4iAhEOJqQjuCGVYrBYwp6zxpzUf6oqJS4jtzXmrjdB
 hi/KQM5uC+t2jiYGFynwCKEeRUjgUqHf8jTZbKKVT5BpLvjw3H47HQuTVDJzZUPJhsrf
 ue+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=kZCBSloje9XqtTEpv7EcNMvQtBKDJh6EPwCU600igOY=;
 fh=4ivWkEUXY+NVQ+qfVi6UGWDLLuIKvydXpLYI5isBRQw=;
 b=nqIFg3ivkEzM24U53D84VN8pTIdsJFPGoxa8S13hCVj/GrHQ25puYeS0eTuris0gEK
 VIQ9suKfSWIcfQKij/RX7d5usZymO1TyoF6x+hI67jdNV7cnlP3tphl+s9EXjOeELCt+
 E0h2S3LSldHLC03WGnUliGM+GFxPI6zLqdCeSOJgsX8jaXahP5iXyLUnt2j1NQhmK9hQ
 GVh+42INBwswff3Uf5ySEGy9BasivTjOO3O6e9MwZmDQvmxOScueEqK0tPhA7+s/wkUs
 u+gu/qup/iLdjZF+e7K4XwNXPQpIiLn/5Oj1ZVxsEyynMkKJ8fFGeP3VUMGXBlsyuTOc
 rKDA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793980944; x=1794585744; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kZCBSloje9XqtTEpv7EcNMvQtBKDJh6EPwCU600igOY=;
 b=E+z0Wq5hYM2dwqThCFuhhet7H0P2HbDdUsa8R1vkISm/vBdaWtoG8NZGn9T8/etvni
 aCBzlsDLSh1sCDATb3DwpSAFKoLu5bDaA0RjE6O5mTZFt96a2EfT1gkmXy62UXAhn295
 j7duoypqi0Ij4Oe70adLpXL0EpMggSshElEAb2uDWZQnSDKEqtynMhGNLlpg/kW1Uxkp
 iSMVmlhNOQ9f3Vtc1rnbD2rZf59UYql0IKpP+mDRI5d1FiRlYFEPbnv0Li6ulsTBMGoc
 XpBLL3v3dx1fU1iocbLXe4W+Lq015e5dSraRty6vGY/gADfTLikaM//bDawMYIRQJXBH
 lEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793980944; x=1794585744;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kZCBSloje9XqtTEpv7EcNMvQtBKDJh6EPwCU600igOY=;
 b=IgKUH1q78UV4vOewRq6ANJpsWYgIZyzRAqM/lhXqxK1wBLLTziSWcw7QWPEflEwkxZ
 DOUKeMybHAuVcvxn4xiXThDcyiL+jbTDu+h6qFrePclL3nXoSdyuw0sj6PtjoCv8SBtn
 R92SmeSsxmsvajaSE/79QzMRqtQSy1INcPt5RJTah44imlc1zQzQUZPlASA4st035esq
 MIgqiRW4OTjGnCMJGUYWSlkJJtTos3yV/RHfehbwtrOXicZuJV2xn+7/4oa1AOrBwxdT
 gry0KrVwVjIJQ9pgXN74cFXimvteNp6pyFq0RxoItGzYufkCPaio52bcYJOiMyR2v6Yn
 sTMw==
X-Forwarded-Encrypted: i=1;
 AL+hErG4wkR4fFb7fAs5x0ud/YgJjd0KvaanU2Kzngr0t3uPWPrEv+1ieI5BNQjoyeM9LnqJ7po0+NK19fDT@nongnu.org
X-Gm-Message-State: APuU4Z+W/FIUqgONO96tLnCXQO5STHL7EVu+Lr3iOiN/uM/3ORrYLbRh
 QLkBeHnjE6SRd8pYqiziEUrU4XA2/cly/I1x2QxZF8YEmXUe6irNGE95s2UF4Yg5mO4TLkpv2BA
 9CuKtdiBZz//WlgqIxAE5PA/zztH+x4HUadPRYx8RqA==
X-Gm-Gg: AYBFou3a/aOvImk0cX3fR1ZJwdqcIWq+c7MhHkgvoEj3u1Awx27AvaY3uh29QDCRbSm
 8Tq0512o9N6IYjL0LWhMqU0Xi93uutMVrWdvTC0cJF3IJcVR+5d1hIwNeJLXOdbq/iE7Kf/f4UJ
 IGd7OSOPKeAbHF3fEif5vLjxuv6BGsjxoZzuTyjGy5EM9AR+LiUYM1zztO5BVC2HB4exEJ1kWjZ
 TthDSDGAqGL9T/mln+Y4cByNWkKGZSyue6nhKooH2+8aRHUpt+XD4r7wwbGCcXiB4u7KH8IbJyS
 RojJNn6SHO+/5koXGhk2Rh3o++uY7Sw5imdABWcheTUn3txpdxAWx80VYPom7bDsxZ4/vHJCabp
 weIFbeeDiWk+rW2UmWk6ttdzqTHnOxuL6O2mqEfntgjEmtdHq/xiy3vL2s62z4nVOaE1GjSm3GQ
 xwyx99eDsLwQzpOaVZ0+5Q
X-Received: by 2002:a05:690c:6605:b0:8b1:a3f3:7085 with SMTP id
 00721157ae682-8b3419c287dmr11732157b3.60.1793980944149; Fri, 06 Nov 2026
 08:02:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-2-philmd@oss.qualcomm.com>
In-Reply-To: <20261105125203.40320-2-philmd@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2026 16:02:12 +0000
X-Gm-Features: AclHuK8uvR8xxkXdSiK1iaQiEfbrGMfyI7ASL-Ch-aBtNpd1c9eXgL8t4kEBjpQ
Message-ID: <CAFEAcA_kzBBUcyPEG3Cn8TnGqvqfOaq4_skEG+r1FXO0Q-n51g@mail.gmail.com>
Subject: Re: [PATCH v2 01/17] tests/qtest: Use qemu_hexdump_to_buffer() in
 qtest_memwrite()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 5 Nov 2026 at 12:53, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Replace sprintf("%02x) by equivalent qemu_hexdump_to_buffer()
> helper and silent when using Apple clang 17.0.0:
>
>   ../tests/qtest/libqtest.c:1522:9: warning: 'sprintf' is deprecated:
>     This function is provided for compatibility reasons only.
>     Due to security concerns inherent in the design of sprintf(3),
>     it is highly recommended that you use snprintf(3) instead.
>     [-Wdeprecated-declarations]
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

