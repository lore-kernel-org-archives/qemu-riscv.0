Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B675606A31A
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 11:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KCZ0J1iE
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMkXx-0007e7-L0; Fri, 30 Oct 2026 07:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMkXp-0007bH-3v
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 07:13:13 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMkXm-00020n-29
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 07:13:12 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-8ab37e44643so4056417b3.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Oct 2026 04:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793358788; cv=none;
 d=google.com; s=arc-20260327;
 b=D5bP7NMdmqBsLlQnvKTV0OTuA4NVSMtKM1tlhpRBGgGkFotmL06TK1ahnt31P6Een+
 7unRos5YFGtgdsoRbzpQmQ0E7DBX/AH/1zUQX3gg/B1At8t9SLtw39GalFCWr0V9JAo2
 zLMC6JDzyb1Ht8akMybLABKQLhosooVsTjYXKs8PT2T9Gg5Eqe3LSe1UlrvLRtVWUYjM
 mpHm4oZ8SxZ26InS1Z01stSAMvzwej75XGN9sSHmdH7TxsVD8OhRAyYeGsZAq3ISuK6F
 TCnbWp9Q4TTLj4lFLYCbFLtOY2E2hLkFj6xatKfnw5o1gDzTepo0uulHfNi2pXzKYUHY
 KL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5LUWZT5k5KvOS94ligsCtD+U9+DDcG+IL6eyG0y0saE=;
 fh=XYUWivezReiDf24aJ16/R+97GyGDarDaTBkYDQ4Z868=;
 b=a45BnoqPNXilBFNUVFz/zxsZa5j0UwU1gRNCxcdly/euQGUz+94fYbA7FH+KCx/MUv
 uK1hVOstGSvNOPK3KOFa674ZRGB8IFA0V479T1INVu6EB6fjjTyVNviiB4nEAsE4zvbW
 sQfpriKJgujGG7tK01KRCaY5mY35Oyxznnsh7H2Hw9xFPQP+walY97SVx/nUulXPlAHC
 YUQ4SKL1xvZtncY6WqFOvEgWe6Q+IMpF0NElCy4xmIzowssOLs0OAElkTlGpYggx/wCF
 zDYFaCXdGf8dG32TNFA8PmzzYkxKn8M7v5BQp7BC97IlDUYM64HY7PnRiNGuGUtZH3pP
 CUSQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793358788; x=1793963588; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5LUWZT5k5KvOS94ligsCtD+U9+DDcG+IL6eyG0y0saE=;
 b=KCZ0J1iEBmI8J5U6EdjfsvTCeKYjYKMqbztHR6fmahYWSDbfk7V/m+UXiO5TDW3cjB
 v/j6f3cKu2fJ9PypEpP2mzaraqvQe7HDKabCHoJv57/bl+1J0gysIid+bzK5RgKPjAoG
 LQivShEZB77UQGiEuJfYTl4RpYocmqcaoTKtqeNexC5JW+MLG+86LEGUQ47gtHcu10QM
 PBViE69S+DQMAaj6SItPJ2oJrjSSexYCiNnS57QXp6Q59KvepYo6G5k9s4g1yevcxdVs
 wFfoU01+RRuFoXO3SPxCBsnt4BelVxHk8FzFaBROM7WRIcf0BjPqWYifyaSZd8SIHPwK
 ouLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793358788; x=1793963588;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5LUWZT5k5KvOS94ligsCtD+U9+DDcG+IL6eyG0y0saE=;
 b=aSJax9blyvk1X/zqLJDdiLhrGyjcjiN6tkHUJZ27agIGH5r+lSu7LiluMhrrOkRUtU
 H8drMArJc4oscQibkY2KIfcqHUKlKfX9zPoKBpAAoL9frH+FQsJTI8Ah5EBTN9kX6/Sw
 uHB6wq1ZS8nAXQyEXP/0gP/KGu9zgPS5bobY9sMj4Q73mpsDYAxpbG2+a9HLBVTEmr6S
 llVTf6eK1I7T8YKZvr09kqOAlygYKQVP6DsZMQFCCM6iluEe2+Ayhj8yLDpbzukgaHNe
 chPf622D4R5yhy+Wp4QolCXZ163sRD1JX8pMmd/zk2XLfrut/FNs0I+VKjIo3j+wErlG
 wCxQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwqTX8cEZHP0IXL1LnPSF4ypPhVC+W85Fy/lyLc4JysV5MeHUoVAf63Jnx87U1/tJECLE5yF4sucxWT@nongnu.org
X-Gm-Message-State: AFq9FYKbDBnxPVV8mhhNlYNlOO+ELAf2QotbwLUpS4XUZ4sBaA1T4pkr
 ryuh+F9yTwr2JatHvwMvqF1HsDgcn0BfjF5uQ7gUKNhM/vBKYK47QTdR9aXhdYa5infStOT6Srx
 usXR+0AU3payWvYc3tDnpO/M5asdohvDjlrXW4Q5qFA==
X-Gm-Gg: AYBFou1M16n1TqKctYevr72i0iCrws+DTTFY+6JTvOOHYi07hlysM2EBpn3bb13vF5H
 eCqaCyDIqI2mBmsKULfJlpwpKV0fp6FE2hoPsPZLzEVTVWqxWJQOSu61olq4VzLuCYHRNVTEDFp
 jr3m4Bk7yeBXRMBgSvVUOzeQT+9h1p+YU4bQpSS9Clklyr5CNtKdRsMa9w70kUDegKr53SzpFvg
 OuNuZxcUUqtRrmfCuWh2XhKsbI6g3UD++UiLzLSE/AxnuLX0LEw+B9HIu8m6L4P+ncnogA4R7wF
 kqETMhN6kDZ0E/uatHHOTZ6phTFemm5lSL6QcpCtjiK/3+me62RxrTy1zfo+14cMI4+92AFzpxt
 RjrU7JKADNpAX8tgPuOI7HsPERWTolUy7gLZDorJCVPz9BYZGfLcJ8u71rcPJu1z/GR6q59M647
 2ajpBK/OJu25Xfnuh/M5eZ8Q==
X-Received: by 2002:a05:690c:e1d9:10b0:8b0:f0cc:db0e with SMTP id
 00721157ae682-8b2b676ba6fmr7498147b3.78.1793358788267; Fri, 30 Oct 2026
 04:13:08 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-10-berrange@redhat.com>
In-Reply-To: <20260911143627.2743803-10-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2026 11:12:55 +0000
X-Gm-Features: AclHuK8tWRtaAMh4OSG81o0Myk5Bd8TN4g8UgRz9NIr2z73xVEtamgvTgzkRr-c
Message-ID: <CAFEAcA8GwF=EdaqvO7OBNZY1ku8LWNH5giveZYXSVnmk9JWfng@mail.gmail.com>
Subject: Re: [PATCH 09/28] hw/net: mark e1000, e1000e, IGB, rtl8139 & sPAPR
 VLAN as secure
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 11 Sept 2026 at 15:42, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> Historically most NICs are only interesting for non-virtualization
> use cases and have not been written with malicious guests in mind.
>
> As a general rule either virtio-net or xen-net should be used in
> all virtualized guests requiring a security boundary.
>
> There are a handful of exceptions resulting from historical usage
> in the x86 world, to support virtualized guests lacking virtio
> support.
>
> Thus the rtl8139, e1000, e1000e & IGB NICs are declared to provide
> a security boundary.

You've said in several bugs (e.g.
https://gitlab.com/qemu-project/qemu/-/work_items/3872 )
that igb wasn't covered by the virtualization use case.

I don't care either way, but I wanted to check since I've been
marking igb bugs as non-confidential when triaging on the
basis of that...

thanks
-- PMM

