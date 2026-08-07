Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99EFC5AC7A
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 12:21:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wsJZC-0001Y9-Du; Fri, 07 Aug 2026 08:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahshehab24@gmail.com>)
 id 1wsJZ7-0001Xs-NA
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 08:20:46 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahshehab24@gmail.com>)
 id 1wsJZ5-0004sJ-0E
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 08:20:45 -0400
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-39c86ce9e29so23256541fa.3
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 05:20:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786105240; cv=none;
 d=google.com; s=arc-20260327;
 b=WsC6MHnpHgOh3mZbeDO0Ts5nvW14kI402TlcT01fRkLPgClWiA8r337o+uO+EzitBJ
 h3AY3kdXpxOmUMO2KK+tctWRUotaJbxwfa/Xk0fNuhTnskCjcHWjLvsKTt3fajAjzKXt
 VjZXJrCAOstdETXPhnbr+SVJDUhLiyBlcBN5Ylejr3KjAvpF70rckr6FCH+JavQkARha
 LpLeLU0JeqeDLIEP8o4ch0vbpiAPv+6LYlC10Mu9Q1z8sgSrfmWQmO3qIcXcM6lu2DD3
 Z+ofcyu1/ckCexmjixOq9lFsnV7nd28Cbb8XQJ9CMiVKu0hSgYfosVkE/3BTBlt46bq6
 Fl9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=3r600VAzrZZcPqNnveFqiPmKCez+VS+LhKY4TXZ/BHk=;
 fh=2M0ijLKVaYT0fA1pBIDTAGht290SHzSnJ9fAm0Ku2/s=;
 b=E98wnDxHCngA6DaghpMoNWUV+CXBwchspS/IpmSs6niPg6J4oMakECASyorAygAeZ9
 LnuvYzit1I4nbsRveDJ0Wl70ye2cinP0JYidykvrk4R4XMJzUD669fDvg0vvISC5nIav
 4Hfx7uHANzS29lSjzdfyB9U5fjGyJLTLv2TCJCVU3pX2VIEs8YaUELjCuJ61GT5VfSDJ
 jDkDnpCbig265J87B1unLKH1QK8j0z95qeB/NXx0RWycL3/aH1gZdIwiZfnwDOlzMwrZ
 Wx8EOoFCGigrhr0ToAjIesHUXZ1SXzYOx/g8DzB1ihRusnr5phSC4L0b3+IzzD079C1l
 KKgg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786105240; x=1786710040; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=3r600VAzrZZcPqNnveFqiPmKCez+VS+LhKY4TXZ/BHk=;
 b=Fj+AUEBAVcwGhaUpFsoB42+A1GCZBJQd2rItnrkcwMYyBQXNWP0Eulq9EjQbH6iOwY
 mS+ThYI0pV+reFB4Uv5sHzgFWZRu8pBcECNoRHOf4Mlagz6O2x7eu8gnSGXmbOUvHEvH
 7zizehWNycZLTJUwAxgagz3y0y9LSv9BQILgdrwGFRHn56/s8iJTWHWKkr65WougBd6t
 5AFNFWccBrZN7vLwZHWNtFUyCquDb1VKNJfjpuW3TL+JNsUbqlT1pKFkVU6aYAzFp1cm
 1dpftLIUEyohF/m9lipK4F6isUS3RjpqMj9jjVooVasSr+3pPvDhGCiDxQA8n+oiKQmC
 T6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786105240; x=1786710040;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=3r600VAzrZZcPqNnveFqiPmKCez+VS+LhKY4TXZ/BHk=;
 b=EuUIdyaSxDRyIU7avb0VjkhPmrdGwwmjbeedepc22O8+osgjHlOz3mYCjq9r4NgxzX
 jb0VmV4KEonxCXYAPvb6kQcPfb68mCpRroFe17ujWi6zivuzVpsd9nirGhF7kRjypkRn
 6qtbMcHM8BqsI/rVJYSFqA3Hi/9TlwKdaQDYvUcJnK74YbLbMDrl7dEe/WJQ+dTorxng
 +P185piONlf7ToE8vtYRFQei/QU8kVdSpUNh+eVGnbfFA/uQEVEeXHTW0gRHzoA0nGEM
 iBTcwVaXLKyQaEau+RwgR8yoAD/U9UcUazCYl9GbqVn0BHu/enIMVzhIhGernT43K81n
 zWfQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp4R+6tg4LVV7oiSOVGlFksXCO6IfZSELPLO21Wp0JkrsKCP2dY7xmlZ8CA6n9+gH2P0Xr80wAKczSQ@nongnu.org
X-Gm-Message-State: AOJu0YwjDMIHu4Xx8qXr0SlX6kMGTF7ctqplefeZa+Auxt7aXcF2ghip
 IiOAImUMykQyavrxKm8iTz+v9iYBaM2UH8nF6CtDh1tn4Cbd4SP33qARUgz0RPOf5/u35g35tEs
 OMjpCZD8ZqCcQH1q+ooZD30Sn2gzKw4NpRfId/drHpe/4dBA3WoLqtkU2N2bnOu9uGpGBq0A=
X-Gm-Gg: AR+sD13Se8Jm5UP44VZzdNOB3VPVepMOZJp9GOVqCH5QbD2IqCwlRSkLvf659/l4/Uw
 OAoAFn/giSbkyMxtZEVnHOHahF94w7tAiP1+qGSeUZpPk5mXAaAhlNuGl9kcfBOS7mDLRCIsa+/
 9Mqm4zSl7Vm45jhQLuz+549lL9B1/ny2RuRSCX8VxtHtxV9zQSVu757H6PnZ3+WHjfawG3u6krx
 +md1/HqXopR9qYYT6oxu//YCVFrcx3B31ohNJf1PXMFs1ABObOe45nul2mdd5SnHfgZNRbz4Y94
 m797gNOfK42ItZJfozxQtiffG3xwjOCvMlMep9RiJqrR+Q3c8hM/T/Fh
X-Received: by 2002:a2e:b8d2:0:b0:39f:a2be:bc61 with SMTP id
 38308e7fff4ca-39fbb3227dbmr23510591fa.27.1786105239776; Fri, 07 Aug 2026
 05:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260730181852.1622-1-ahshehab24@gmail.com>
 <CANiaA1v6qFSMMDBp7dHqKWhW3d7vRQUMXDB3+vDuaWqLGCk=xg@mail.gmail.com>
In-Reply-To: <CANiaA1v6qFSMMDBp7dHqKWhW3d7vRQUMXDB3+vDuaWqLGCk=xg@mail.gmail.com>
From: Ahmed Shehab <ahshehab24@gmail.com>
Date: Fri, 7 Aug 2026 15:20:27 +0300
X-Gm-Features: AUfX_mxdLZnIpHvtQnmuEWEgToVsMBusW1IOy00OEEkr7uWi-ihpUWTv13QoqYo
Message-ID: <CADdZfQQMVd_K_HEzoc0taKaDZm18G95O_ts_jaESFgDHRevHMw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix PC sync in trans_sspopchk for CFI
 exception handling
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>
Content-Type: multipart/alternative; boundary="0000000000005933020658740851"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=ahshehab24@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 MIME_BOUND_DIGITS_15=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--0000000000005933020658740851
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=F0=9F=91=8D

Ahmed Shehab reacted via Gmail
<https://www.google.com/gmail/about/?utm_source=3Dgmail-in-product&utm_medi=
um=3Det&utm_campaign=3Demojireactionemail#app>

--0000000000005933020658740851
Content-Type: text/vnd.google.email-reaction+json; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

{
  "emoji": "=F0=9F=91=8D",
  "version": 1
}
--0000000000005933020658740851
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><p style=3D"font-size:50px;margin-top:0;margin-bottom:0">=F0=9F=91=8D<=
/p><p style=3D"margin-top:10px;margin-bottom:0">Ahmed Shehab reacted via <a=
 href=3D"https://www.google.com/gmail/about/?utm_source=3Dgmail-in-product&=
amp;utm_medium=3Det&amp;utm_campaign=3Demojireactionemail#app">Gmail</a></p=
></div>

--0000000000005933020658740851--

