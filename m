Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F14F606A31D
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 06:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=IanTr1WC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLxcq-0007tK-MQ; Wed, 28 Oct 2026 02:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLxcm-0007sZ-3q
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 02:59:04 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLxck-0007qt-42
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 02:59:03 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-c2e8c710847so76458066b.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 23:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793170739; x=1793775539; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=TUL41p1sRr04sthV9etnejH/dU+ulBNsksLF0BLrBjY=;
 b=IanTr1WC4pXaJCBdgN7cu+YOK/s/u3C7Zk0YgpBR3itT+SJAP12fK4BUlV9Op/cESB
 Zuj5MenYmuTrlZLpS8t1fEvkCUlVQ8GLyVwWJ2BGBai9PJfgisSu71WJGqrXLtclvZ31
 C+s6cjS9Lh8sVIc32b8LTu4cnLG3Mlm2EPoXGtyvCtAuTTDgWv97NPd3LiPNqiklt/7F
 CAyx1MWHT82it2msmIBGNooNUcxCaJC1SOFte4+JAV/2UQaeF3Prl6bTf2OYG8L6Nq6B
 wdDuIzPTuGVkpddye3cwmGpaAMvj4TaR2SINbS8vtdpXzHAAo0WVuhmTBWN9CK5IJmnO
 tWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793170739; x=1793775539;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TUL41p1sRr04sthV9etnejH/dU+ulBNsksLF0BLrBjY=;
 b=QpSvAsyUOe7b1y8P6QJU9jnIKerGh+nh0Wrp8+6TckN6lxE7hW1xIzTxIJF7VUq2tG
 a33kRiXbV5uXd4lp+O9rE5W+IH/2BJcbiZ4tzVLzj4UE6SOSZHWIW8ZiK7VDwfWhJXTC
 9+EGwCdrOx8yqUKxi09GJS2JtbafYEeGyMzOc55n2Ywyx2dkgjqMvpBj452jYj5+uHEG
 pJHtmFqtJoA8GWt81AfW42nmJ+2WM8IW1gT3v06EEmGEUtr0TqchgeYdtWAFlEOTXvp1
 ZdaiOM9kJD85fM6jn+DW8PHwWPsttDS0x6FigxBbLoX4nY8jACwP2v+JV1NwIApS3DdS
 9YTA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzw5FTLJ/Bc428z9eJHGReb03MS6mGAdfeQsPPAhEkaJqqZgIj6Qd27i1oDe/ybTvDagLmWDHLv0C+3@nongnu.org
X-Gm-Message-State: AFq9FYIbRqdgQogWCbhc27D9Fvz7hbx4M0jXxdZtKkr5IKZTrDuHjRJJ
 +UeOLcTutajN6aHeVLFBsP2qM/9LrHYMO9pgFxRciRYm5DA7zdSQcLm36sCuV+yAe03ebSXHT5G
 OCMK4/6FT5wq0DeVizaKwdXR8rLq20i7QfqYJ3gkVcNJPLX4TlFTULzYUcJu3NKcTl9S4pi3W6Q
 /LCNyEV7u73SctWZNbeonZjnfSKGOKEUSDqY/pDe7Tmlk=
X-Gm-Gg: AYBFou2MKAt8s8IOIwMY2ebAlT+8SHRiHYtOUvzIX8NHlhsbfKRwaRAXNeO56wOvb9w
 eQLUvStxo7u7LhJZEVZ0V5rkJvocJhkHzVOdaVO1smD2Mw4/G+NWQNLmXVBl0+YW4kY7JDG18tD
 yzVixlZTmKjOei6ghODWA7yYZ3FKLKn+hD2jWmQ8YrJfmzrLwddKB0JeRaWgs90seVuR+C+79kU
 uBVy8VmH8WrShTMyif9pvOdDxD6oXIA61mCZUPTmjwyE6ZhEdpd197ARHTSZtMFwzykfPcsO812
 I8x5FjGMiXnpmP6yrtT3WVYN3drs4gxewCwD3n8DSzSHJDp8lblOrJRomWV4lWhnEvtSryX/Uuj
 XB/UblWi6BemzHAZONc3lvJAclVU56kYK2OQAC6IKFydmKsdWi2jo4paLQRtbajCNezxFXB/q9P
 cfzsra6nFBrui5gBRntgCA8s2dZfU6lkTMhTaainDUM8uq2m+w5/Dys/5SFINzmDt+E8JkXgTxZ
 ELlWCrkFZYM+7nD/mqZOVbWioRupGGzs/eAec3MhBwp16pTHU3dt4s0ftS5dcVM30fAfuVRHxO9
 LbePc2U1pHcVxPUDUFvYZNzorLLUdMrsXx7DJKMkwQ0jfWT2qQoVhbYMXKNAkfvQteM1YjXTvBB
 OFoR5uhvzCB4N
X-Received: by 2002:a17:907:d92:b0:c37:8ccb:9b76 with SMTP id
 a640c23a62f3a-c49be06d8b5mr107104666b.40.1793170739039; 
 Tue, 27 Oct 2026 23:58:59 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com.
 [209.85.218.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd7b5d54sm552207566b.86.2026.10.27.23.58.57
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 23:58:57 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c498fa2f365so74089266b.3
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 23:58:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBwLCHcbfRot3ldTRK9qVKSFVHiOLF6hNFWOrSVNfAee/g+zXSvTuBdP3yrZWYyk8APZTDp4ZtmuH/Ma@nongnu.org
X-Received: by 2002:a17:906:9f8e:b0:c3f:98d4:dfd0 with SMTP id
 a640c23a62f3a-c49be0a32c0mr109713566b.45.1793170736862; Tue, 27 Oct 2026
 23:58:56 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
 <20261021231346.2452179-16-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20261021231346.2452179-16-daniel.barboza@oss.qualcomm.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Wed, 28 Oct 2026 14:58:45 +0800
X-Gmail-Original-Message-ID: <CAMXXpfaFNemWZ3dWOuKbTwn4OcVJOxVJvAZ7AS3zrnT4aQYv-w@mail.gmail.com>
X-Gm-Features: AclHuK_a5AqeoA3pIAlIaTjMHoH0AVcld8rWvFjbleQ_Cg5z0F8LLuu4-Hr9DL4
Message-ID: <CAMXXpfaFNemWZ3dWOuKbTwn4OcVJOxVJvAZ7AS3zrnT4aQYv-w@mail.gmail.com>
Subject: Re: [PATCH v4 15/18] hw/riscv/rv-trace-messages: add format 1 msgs
 with branch info
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, antikostya2@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="000000000000cae2b6065ee118a3"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=jay.chang@sifive.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000cae2b6065ee118a3
Content-Type: text/plain; charset="UTF-8"

>
> +size_t rv_etrace_gen_encoded_format1(uint8_t *buf,
> +                                     uint8_t branches, uint32_t
> branch_map,
> +                                     uint64_t addr,
> +                                     bool notify, bool updiscon)
> +{
> +    RVTraceMessageHeader header = {.flow = 0, .extend = 0};
> +    RVTraceFormat1Payload payload = {.format = 0b01,
> +                                     .branches = branches,
> +                                     .notify = notify,
> +                                     .updiscon = updiscon};
>
Should we also initialize .branch_map here with .branch_map = branch_map?
The function accepts branch_map, but it is not included in this payload
initializer.

Thanks
Jay Chang

--000000000000cae2b6065ee118a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUgZ21haWxfcXVvdGVfY29udGFp
bmVyIj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBw
eCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGlu
Zy1sZWZ0OjFleCI+K3NpemVfdCBydl9ldHJhY2VfZ2VuX2VuY29kZWRfZm9ybWF0MSh1aW50OF90
ICpidWYsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgdWludDhfdCBicmFuY2hlcywgdWludDMyX3QgYnJhbmNoX21hcCw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1
aW50NjRfdCBhZGRyLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGJvb2wgbm90aWZ5LCBib29sIHVwZGlzY29uKTxicj4NCit7PGJy
Pg0KK8KgIMKgIFJWVHJhY2VNZXNzYWdlSGVhZGVyIGhlYWRlciA9IHsuZmxvdyA9IDAsIC5leHRl
bmQgPSAwfTs8YnI+DQorwqAgwqAgUlZUcmFjZUZvcm1hdDFQYXlsb2FkIHBheWxvYWQgPSB7LmZv
cm1hdCA9IDBiMDEsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgLmJyYW5jaGVzID0gYnJhbmNoZXMsPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm5vdGlmeSA9IG5v
dGlmeSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAudXBkaXNjb24gPSB1cGRpc2Nvbn07PGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxw
IGNsYXNzPSJnbWFpbC13bmZkbnQxMCBnbWFpbC1fMWliaTBzM2ZkIGdtYWlsLV8xaWJpMHMzY2Ug
Z21haWwtXzFpYmkwczNlZyIgZGlyPSJhdXRvIj5TaG91bGQgd2UgYWxzbyBpbml0aWFsaXplIDxj
b2RlPi5icmFuY2hfbWFwPC9jb2RlPiBoZXJlIHdpdGggPGNvZGU+LmJyYW5jaF9tYXAgPSBicmFu
Y2hfbWFwPC9jb2RlPj8gVGhlIGZ1bmN0aW9uIGFjY2VwdHMgPGNvZGU+YnJhbmNoX21hcDwvY29k
ZT4sIGJ1dCBpdCBpcyBub3QgaW5jbHVkZWQgaW4gdGhpcyBwYXlsb2FkIGluaXRpYWxpemVyLjxi
cj48YnI+VGhhbmtzPGJyPkpheSBDaGFuZzwvcD48L2Rpdj48L2Rpdj48L2Rpdj4NCg==
--000000000000cae2b6065ee118a3--

