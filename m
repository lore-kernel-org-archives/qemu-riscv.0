Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60688606A31A
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 06:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Udn0NSvG
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLb6d-0007GU-Qn; Tue, 27 Oct 2026 02:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLb6b-0007G7-LJ
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 02:56:21 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLb6a-0002KE-1f
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 02:56:21 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-c43fbcb4393so528421666b.0
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 23:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793084178; x=1793688978; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=j5Hic5eKOORlv5GSjXr0pV1A8SO1Xs2+uTB+W1RKx7U=;
 b=Udn0NSvG/6DH4b5OtBnKNAgG00wKsEnj3NFVmssfpb31jiNYGDbUdSsPexIEaGkEYt
 /z4BTrzyHCEuZzAX7OKDVYrSZmKZPtk6svct5PbCQ76pXDA/WzUJmtDmCyJdVqqF2c2Z
 WwnuLUMXTxmIl+RjF1FIFKdfubTICHdS/tun8cck8VDpeNyTFemhdhV6PvWbW8cpvtG0
 a5vM7G5OQFMRH7LdjGePO/3vNKUsqjA4bmg6Jo4oqqdMLCZo5JfWaNeaicHVJm17OOE2
 Q7GoMBd1SiBUqk/v4u9ks1l/bJ+mmOqybOk7zFzuTYIb+QkMbnRau2jcleHycYu0J7p4
 g8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793084178; x=1793688978;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=j5Hic5eKOORlv5GSjXr0pV1A8SO1Xs2+uTB+W1RKx7U=;
 b=YMMvWMbFJHzr3gToCmIwlfoNh2L6TUYxIwij1Ap4Nt3d8pBDyT64ciXNXRRshGWA2R
 46veCov4PbKEybqAn7hC8qYFcqHp6JwGaQGVGO51Pjmx2QmyV+wl2KfZVxlcL/HM9TI6
 2abGdGYXz5ycZx8nKcahuLSEyETjGLbZMXfe+pspPM/N2K5tYPsTkHz+Lp8DKnBP9IYw
 jQTLjLDKr9eF4pRFw0304Hlp15r5v2LNMvV8xOUMyOGtVEX/+nvv4AGXDwwxh3I0Fgyz
 k3bOi5g0NFy+uzrk/U5OhO46IwLJjC5T8IEroEpnu5Ccxznol/Ko9/DQzdajlmYFCn6N
 s1vg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzkIs6DMQj5EKNzUxyDh0RBIyaU7vI/okvHktnKKTcn2/tSw/+BntJjdb29RCDObQ8TrWy7z9GZI9IP@nongnu.org
X-Gm-Message-State: AFq9FYIasMKdMwhgsO5Cn8GKTzqvN6WNUq2+Eev5IuTwiw1z4ZZtmS77
 kYeoRhu+K4wmo9P99jwFK10ULbTcRz6X36xUepvzfOVpbIiVz4b6MqwJmcgnK79+4pEQ8tYa22l
 nkUR1yNFeaJFMxg1usNOWkSkYPzywEHmL+hVGndLWa4MTQUgzeo0m9YhI79feX4aninDvtiTYtE
 cueAf7UGotDBDyRNPhlyR/T8L/YKxqmXGBo9nFIBCXRq0=
X-Gm-Gg: AYBFou0cFlHfFamHotsIdarecuoH7L5PdAWA8OkFUOrVCaoQdMokDAsBAMQatzPk684
 ++9K8BM0JtlKbDlY98IpBgAxKGuu8dDpJo9Ek7a08/1Idqilcs5Gio90HfC8Zt496uc8sNcNzqf
 NfFoEWY4gbJzecJLfDPKuivx0nrqLN2dF7GozcRPX0I5W+lWGUo5Rxlui6ZDtL/7wwHnymnCK4C
 MJHxZ/QlgVrFlCx+wGAxyM8k+zKhyfu/yWFpuoJwVtIt0YQoAfgCXLoOUX6qF4cRteQqiVuC0Yz
 s7at4hRDNbdwCGM1q7lbSyUZWCpaE2XSBKOA3gJXRKvY0LbsxH/3tGtZGJAklwfM9x2fVuqeBCs
 JC2COF2EwsJaPROn3YEBuMo6qTs4M9o6ZnNoRJsux6oM9EjD3tlFc9grOfgizoM2ueH+YTM4LCy
 Yu4/hRUSzwSXuzuulXRzd+z+2o/s6p1kZuvelE/aJMODGQERqdF6h3wUbqJ5MWz2xWG7tt19S4V
 EngRJ46xYrZJp5okH5Vdd5c4+AnQZpE+U7msgv7XzvJ7CBuPuNRHg76K07e1x1eenPcqX3Y2pgP
 gRQBglAnzB3XirntXA==
X-Received: by 2002:a17:907:1c94:b0:c3e:ee86:d2c with SMTP id
 a640c23a62f3a-c46bde4a2e8mr953059466b.27.1793084178265; 
 Mon, 26 Oct 2026 23:56:18 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd4e9968sm405369266b.17.2026.10.26.23.56.17
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 23:56:17 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-6b2237b596cso5817452a12.0
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 23:56:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBwmC8r6DhpiCLQIm8KZkl4lVsdpRPrNqtONSuHnrFHkFeCicYbpbfPFrsiVU+TQqp2qU/8JIGIc/9iP@nongnu.org
X-Received: by 2002:a05:6402:a15c:b0:6b1:a647:981e with SMTP id
 4fb4d7f45d1cf-6b442fffdaamr7072338a12.24.1793084176792; Mon, 26 Oct 2026
 23:56:16 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
 <20261021231346.2452179-4-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20261021231346.2452179-4-daniel.barboza@oss.qualcomm.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Tue, 27 Oct 2026 14:56:05 +0800
X-Gmail-Original-Message-ID: <CAMXXpfa=h0RMtAtgY_aH_nEODpLGfNX4Z4J-rSm_4++Y9VfFtw@mail.gmail.com>
X-Gm-Features: AclHuK9i1RyZM5cmkJ4U-440SnMdtY4axXUljOsJuX1nZeWOy2P7Ft2TgqqOLlA
Message-ID: <CAMXXpfa=h0RMtAtgY_aH_nEODpLGfNX4Z4J-rSm_4++Y9VfFtw@mail.gmail.com>
Subject: Re: [PATCH v4 03/18] hw/riscv/trace-encoder: add trace start/stop
 logic
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, antikostya2@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="000000000000690323065eccf121"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=jay.chang@sifive.com; helo=mail-ej1-x62c.google.com
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

--000000000000690323065eccf121
Content-Type: text/plain; charset="UTF-8"

> These flags are controlled by the trTeInstTracing bit. This bit requires
> other two bits to be set beforehand (ACTIVE and ENABLE). We'll revisit
> these bits in the future as more features are implemented.
>
> While we're at it, add hardwire bits to indicate which features we're
> (not) implementing at this time.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>

Reviewed-by: Jay Chang <jay.chang@sifive.com>

Thanks
Jay Chang

--000000000000690323065eccf121
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote gmail=
_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">These f=
lags are controlled by the trTeInstTracing bit. This bit requires<br>
other two bits to be set beforehand (ACTIVE and ENABLE). We&#39;ll revisit<=
br>
these bits in the future as more features are implemented.<br>
<br>
While we&#39;re at it, add hardwire bits to indicate which features we&#39;=
re<br>
(not) implementing at this time.<br>
<br>
Signed-off-by: Daniel Henrique Barboza &lt;<a href=3D"mailto:daniel.barboza=
@oss.qualcomm.com" target=3D"_blank">daniel.barboza@oss.qualcomm.com</a>&gt=
;<br></blockquote><div><br></div><div>Reviewed-by: Jay Chang &lt;<a href=3D=
"mailto:jay.chang@sifive.com">jay.chang@sifive.com</a>&gt;<br><br>Thanks=C2=
=A0<br>Jay Chang</div></div></div>

--000000000000690323065eccf121--

