Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2A2606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 07:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=c7t+Ek+e
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLxzd-0004sB-K1; Wed, 28 Oct 2026 03:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLxzX-0004ru-7Z
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 03:22:35 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLxzV-000291-M1
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 03:22:34 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6ae14eecc64so1039482a12.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 00:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793172152; x=1793776952; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=t29zqf7Jc2ovp8HZqV95KX9OteK2WU3BlLCnMPHXXaA=;
 b=c7t+Ek+eOJ5HP96/titnqGcRXZz3yKzs2nKFHBCOiMrXCC4IBdsIjOpM96huKDIthv
 y+gwLvFLmXpxouEvwYmJ1jmjWGzdq1EWiKth293DObnEpxZqGtJ6+UNr+72rh8lRRErM
 YHTi+jgXHHLlCxr16BhikhL7Vm26Bakf6SmvoSHlVs35T7vevZVvcdVFMCe5jbPqdkZ+
 jS/BPInXAKKbvoDpz2bSndTbBEUt/aRHtkY2VB7mBuTYZB/3XAT1O9iT1r1Q0OSudURB
 TW56T7KvWFAXnHFT/L9+KQXc9Yw1E4tqQLSrr/c72qMpaTsMEdRWos2/i7pXfoIxeM7K
 tcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793172152; x=1793776952;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=t29zqf7Jc2ovp8HZqV95KX9OteK2WU3BlLCnMPHXXaA=;
 b=DZra7ITEd9onzVQQrPitwsyRgX+3CJ0SqnOJcGinJF2TMQP4aTXUN9ExdQ21mYEUeD
 LWBnpu+GYjJ4IsmSsLOMk18oKwOqNr9ZjEKrxeMK7F4/WsBYas7NtwD59Z5WXvpPmKyA
 7TzzQ/Z8h7gmKEGJSJi9E8mK6G6AIS18bLUoSd9u4yejbrzVPzYgXzUuxhu0h06yzb3k
 BRaaPtWRcljeZ+Bssdq9JUiZlZG4NRCop5pdUGMFfjlKyj3MlkDIlcD/EdIKffnNe3Qa
 qiuPlN5Ko8HgO/SFILfiKDbn8osK3qNX97yDMNegSIEp3NY3aPfWEHlSLUH9ploZ3ue+
 wM+g==
X-Forwarded-Encrypted: i=1;
 AKwUvByA7NMpHVVfiq6l5vBTBrchxodJoIaSxf80nzOJHC9ui0gCVUVXb80NDPSx2f4rJIJtgZrEn+TODUFi@nongnu.org
X-Gm-Message-State: AFq9FYJx2HWxSh10bruK9RI01g9IIB358HNwGChqDeauGC3baby38Tw8
 2DpjsvhuWAY9IIGS4RQky4DccP7yl4Z+SmJdvAlFQ2p6mc8Iwz1dFLHO5IzuWGiBdgBkherIECB
 EFQAB2ySqAOAEU2vw0S2v1NbqrCnCYf4U13TuebI522INNCkS4ZgazObRaC5OcL8BjDntOI7/LT
 MW+LgX4xk1fKPrdkYH8Be6hRn3VcgMoTlZP6tOUUcTzck=
X-Gm-Gg: AYBFou2OKZwH46A0ldxSlUmtDSpsOSQEqv0BEpn00333OaSz3L/m0teAAr7Z8kw9vYD
 pjC2qqZ619YUjT2cfCh6Oqt5oix66DenKMqhf6ZOTXxGlfQW+WIHOZIX4+sKKuwdDJNNfj2dIy9
 Xf0sN+OAErFJBcvW1CfS59xewQHDLvLMDP+7Yo7g/Y+3myR7Y2AUqlSjpAfBJyoufeIbT++pWfE
 Ht5kdrhOFmO39mQT4RK0hKn49gYE30AaLhChwWKPAGflw6sYXum864RB64xMQlWsSGVM3/O4arz
 U/v3Fdy+OqKPrRwQG1ilS2XQLf4uPniCjGwnjdHN4APl209bQ503y90ZpnBG8bzPLotlPhNuxWz
 Off6st0PGnouVdxR06CxLf0gjRnhVUZ3Q5FM0pTLqKWviFR658hyuPvAJsOI+Ag5cOXdbIuZq9v
 6E/E9R27q3QnjVCaH+R7uEVJRGiFyM7ofdeMowclpswUzLkqs45yY+GU+JYMbvrgcOlM4sVuktD
 wvqSJWLyN204S6awc4vYg9QC0mL8484USbqMVIsvtRchJNRpHdL/e7H4daP49NwBh4sItBWGM5r
 /8+Y3Ljjazp8fJtIncFNyNbEBmRTSifyfhIQuaWxF97koJpZw1b9hfASiUfgr+7DamE=
X-Received: by 2002:a17:906:6205:b0:c41:9228:baef with SMTP id
 a640c23a62f3a-c49bdead419mr108429966b.8.1793172151836; 
 Wed, 28 Oct 2026 00:22:31 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com.
 [209.85.218.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd4ea39fsm567079066b.29.2026.10.28.00.22.30
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 00:22:30 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-c4550d8ab15so76942766b.2
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 00:22:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvByAc0n7pCrJQl/pNFa05qfYKEW/d7qUMOzkWzsOYJUn9j2w44OEG9Ak84mBmviFRHbA6VPkA/to0foy@nongnu.org
X-Received: by 2002:a17:906:c113:b0:c27:420b:7c79 with SMTP id
 a640c23a62f3a-c49bdf89528mr119252966b.48.1793172150157; Wed, 28 Oct 2026
 00:22:30 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
 <20261021231346.2452179-18-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20261021231346.2452179-18-daniel.barboza@oss.qualcomm.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Wed, 28 Oct 2026 15:22:18 +0800
X-Gmail-Original-Message-ID: <CAMXXpfZfGk6LikBdYFHiUe58LLv71Btejuh0O+tWTqqDJ_cP-A@mail.gmail.com>
X-Gm-Features: AclHuK_GLrUiT5aSPwvTS2esdG5Oq-sMOBXCtquK3zgvkyKKbRhZGHG2njXrLcA
Message-ID: <CAMXXpfZfGk6LikBdYFHiUe58LLv71Btejuh0O+tWTqqDJ_cP-A@mail.gmail.com>
Subject: Re: [PATCH v4 17/18] hw/riscv/trace: update branch bit in sync
 messages
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, antikostya2@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="000000000000080845065ee16d66"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=jay.chang@sifive.com; helo=mail-ed1-x531.google.com
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

--000000000000080845065ee16d66
Content-Type: text/plain; charset="UTF-8"

>
>  size_t rv_etrace_gen_encoded_sync_msg(uint8_t *buf, uint64_t pc,
> -                                      TracePrivLevel priv_level)
> +                                      TracePrivLevel priv_level,
> +                                      bool pc_is_branch)
>  {
>      RVTraceSyncPayload payload = {.format = 0b11,
>                                    .subformat = 0b00,
> -                                  .branch = 1,
> +                                  .branch = pc_is_branch,

Spec says that
"Set to 0 if the address points to a branch instruction, and the branch was
taken. Set to 1 if the instruction is
not a branch or if the branch is not taken."

Thanks
Jay Chang

--000000000000080845065ee16d66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUgZ21haWxfcXVvdGVfY29udGFp
bmVyIj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBw
eCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGlu
Zy1sZWZ0OjFleCI+wqBzaXplX3QgcnZfZXRyYWNlX2dlbl9lbmNvZGVkX3N5bmNfbXNnKHVpbnQ4
X3QgKmJ1ZiwgdWludDY0X3QgcGMsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFRyYWNlUHJpdkxldmVsIHByaXZfbGV2ZWwpPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIFRyYWNlUHJpdkxldmVsIHByaXZfbGV2ZWwsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJvb2wgcGNfaXNfYnJhbmNoKTxi
cj4NCsKgezxicj4NCsKgIMKgIMKgUlZUcmFjZVN5bmNQYXlsb2FkIHBheWxvYWQgPSB7LmZvcm1h
dCA9IDBiMTEsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAuc3ViZm9ybWF0ID0gMGIwMCw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLmJyYW5jaCA9IDEsPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5icmFuY2ggPSBwY19p
c19icmFuY2gsPC9ibG9ja3F1b3RlPjxkaXY+U3BlYyBzYXlzIHRoYXQ8L2Rpdj48ZGl2PiZxdW90
O1NldCB0byAwIGlmIHRoZSBhZGRyZXNzIHBvaW50cyB0byBhIGJyYW5jaCBpbnN0cnVjdGlvbiwg
YW5kIHRoZSBicmFuY2ggd2FzIHRha2VuLiBTZXQgdG8gMSBpZiB0aGUgaW5zdHJ1Y3Rpb24gaXM8
YnI+bm90IGEgYnJhbmNoIG9yIGlmIHRoZSBicmFuY2ggaXMgbm90IHRha2VuLiZxdW90Ozxicj48
YnI+VGhhbmtzPGJyPkpheSBDaGFuZzwvZGl2PjwvZGl2PjwvZGl2Pg0K
--000000000000080845065ee16d66--

