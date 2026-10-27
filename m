Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EFB606A31A
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 06:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=MvcaJjvk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLb7x-0007bQ-PY; Tue, 27 Oct 2026 02:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLb7s-0007Zt-K1
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 02:57:41 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLb7r-0002XO-4D
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 02:57:40 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c46822eefb6so493117066b.2
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 23:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793084257; x=1793689057; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=dw1sdPL4tbSNXfnNMoDydP+VF2bhdsxJg7+5ckdvWKI=;
 b=MvcaJjvkXmURD7v86/buq4z9N3b4xgKqtPN5PSb0nXvHkWS4T34gfdEsBcvXVHmuFV
 rxD4meMpRhjBaYr0ydh05+PNfMaoDThAMX6D2X5TmXm20FvCUurLrdnUPCiL+5n1kJxt
 r/v9RZ12a1ZZRsM4Mm/p/5fRTNMn+xCJsJy0gjR3wITXanWzxFYaRl0bKL6+neHCR8/+
 YfGvsAfo0WREJE+uha2BLc1BAe1jj2ZcmezsqL4Jmxgv8dFoub3APDhn7tkshLmypGvQ
 sM3NLvejInuzKpaEya7bh9TQksROpkGlsfRUHsUpcWoYu+gFBiuxI8PfQWis1wGRa/En
 3JDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793084257; x=1793689057;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=dw1sdPL4tbSNXfnNMoDydP+VF2bhdsxJg7+5ckdvWKI=;
 b=bGogOeiisYEvgUb3qLOKsP+kxp/sVBfROk44ElJemKt7zBEMTb/TwdG4AlJu4yBEr2
 qVtvQQHqm2En15qyod8DCRm43rMSZnzpgfsTOod3c8L1rUrdZfECI3duVCxLYz8jbzyK
 wTeSks7j/RqWBJ4VjrZBo2AQ8xrhVcwuWgEWTXBLpYW5Q3Z6/uViIPWaoLFacMw2eCWv
 N0Hp5dTBUkTxbob22F+pNQlC2ZFrixwRMBAXOeYxbdGcM2B7t4PE3gctsKwl/79mpiyr
 2AAPnQ4GmtnL8gALZc5GbPyoTyEMK7Hrv/pEOGhXF31Hv/O7GLLymJeKRhJSmYVGwk5p
 zboQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwvnBeU1KNYYRFzsW0sAoh2UVz00pIsu8UI1KiJGgNRLyvZEPeHf6i2kytmMYaukmq8cyR2CXZvsJ23@nongnu.org
X-Gm-Message-State: AFq9FYIYK37MbcCtntIowdH2wBr5vnoynVYjNvigVhXaV/yjjBafPrN4
 FkJ+WCJLDcbsIjjxRUDgEXkXg33dy98XITgJ4J4TadcUJfVolks7S54EcXyUc+rJzrJtXBNs5WF
 4vMEBLXcsJH2QhXlZ5+yIkC2BSj/6W7CbYIySJSJZumXlNgg7eyYihJ5zuvkwQlJgX3ma+WlEtG
 svc7BDQiO/dbJvIpQkVhxZxaQs6QWF0NF60NF+8OBiH8o=
X-Gm-Gg: AYBFou1zH0OM9wZfB6kSXaDph6zhrPDk3p7LQGhfePfFbhyMgn96LB+53VGetqlaoTo
 /bb1A9fu+U7vLoU3xD6VkORTcksNZGDDJout06PU/hTEsMaaIZtII903zAjGa5PCx1eyt7l6lOL
 fyZcdxqzlQVSr7zO5r/UMPZUQRXs+b2vLwfhaF1YbF6PdilUBrwuYrxtv/J43PlL4BL1Xrq7D5t
 F6zy3kX5J4PFq4Whj0QtqrML0Out03grgd6UrV9Q7Ngwfex1odUxWqFMtkVXlSBsvK4wcsZcWFO
 VOtTCqV0L4SWkNXngJHtYSLjGwmVzmEBRaf3HTpgW72FgamQv0DO46POYymMtfWR0+GkUsyNc+7
 5Q5Bq5iCn768TaRFAd8npNI60hM0KiTbVkA6j3U3WCA7PbvW858RlTIZJTKBuhmir1KFMO8MJlD
 3LbpIbIelZIfEwhx1e9doKIVygoXPwz3q031cM4XSKNhAKjxT6Ggwoy6lXP3rUvW6QeI4DPwnIO
 +wuU/ztDPMcm3h4dKlZhg7ZSJLsiC891pF9+rP4VGaWR/SkLN5GVU58aSaSPQkKKxj1Bvs4+zbt
 HT0q5qWkktBRFtqxcQ==
X-Received: by 2002:a17:906:190f:b0:c46:cc9e:a143 with SMTP id
 a640c23a62f3a-c46cc9ea256mr538879266b.26.1793084257534; 
 Mon, 26 Oct 2026 23:57:37 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c49a50c434asm86818666b.5.2026.10.26.23.57.36
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 23:57:36 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-6afbc363efeso5498779a12.3
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 23:57:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBxdXDpRWbTDqGgCxQmwGiF2ysGgolXH1Kx3ACTsGCn1I5o/uWK2+PidiwrzZv+n0Jy+s0918MbhDTFT@nongnu.org
X-Received: by 2002:a05:6402:5514:b0:6b1:b5ea:2590 with SMTP id
 4fb4d7f45d1cf-6b442fc8bf5mr9881276a12.12.1793084256068; Mon, 26 Oct 2026
 23:57:36 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
 <20261021231346.2452179-5-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20261021231346.2452179-5-daniel.barboza@oss.qualcomm.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Tue, 27 Oct 2026 14:57:24 +0800
X-Gmail-Original-Message-ID: <CAMXXpfaHo0X7Sz0=3_eX+CuLcwvrBxJ4TgS_dTc14BKjoA7iuw@mail.gmail.com>
X-Gm-Features: AclHuK9mRfotUtAyfGtMPcM6tAuszmQ-F2f1TRNlb1iTymLbcf563mtsAYnfOgQ
Message-ID: <CAMXXpfaHo0X7Sz0=3_eX+CuLcwvrBxJ4TgS_dTc14BKjoA7iuw@mail.gmail.com>
Subject: Re: [PATCH v4 04/18] hw/riscv/virt.c: add trace encoders and trace
 ram sinks
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, antikostya2@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="00000000000022aa24065eccf636"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=jay.chang@sifive.com; helo=mail-ej1-x62a.google.com
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--00000000000022aa24065eccf636
Content-Type: text/plain; charset="UTF-8"

>
> Add the minimal topology required for e-trace support in the virt
> machine, e.g. each CPU will have a single trace encoder, and each trace
> encoder will communicate to a single associated trace ram sink.
>
> At this moment we're not going to support more complex topologies with
> trace funnels and so on.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>

Reviewed-by: Jay Chang <jay.chang@sifive.com>

Thanks
Jay Chang

--00000000000022aa24065eccf636
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Add the minimal topology required =
for e-trace support in the virt<br>
machine, e.g. each CPU will have a single trace encoder, and each trace<br>
encoder will communicate to a single associated trace ram sink.<br>
<br>
At this moment we&#39;re not going to support more complex topologies with<=
br>
trace funnels and so on.<br>
<br>
Signed-off-by: Daniel Henrique Barboza &lt;<a href=3D"mailto:daniel.barboza=
@oss.qualcomm.com" target=3D"_blank">daniel.barboza@oss.qualcomm.com</a>&gt=
;<br></blockquote><div><br></div>Reviewed-by: Jay Chang &lt;<a href=3D"mail=
to:jay.chang@sifive.com" target=3D"_blank">jay.chang@sifive.com</a>&gt;<br>=
<br>Thanks=C2=A0</div><div class=3D"gmail_quote gmail_quote_container">Jay =
Chang</div></div>

--00000000000022aa24065eccf636--

