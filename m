Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F7D606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 05:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=gPvMhD7b
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLwP5-0007ma-5i; Wed, 28 Oct 2026 01:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLwP3-0007m5-DB
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 01:40:49 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLwP1-0007iP-QD
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 01:40:49 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c450ab1483cso80578366b.3
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 22:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793166045; x=1793770845; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=KPA9q31D7UkjqcHAwkHe6GQHFQdyeJwK78n0ENxvic8=;
 b=gPvMhD7bsz2cMwjs6yFTpzYxgsKFkGnrYfalPaUAreNA6GcfFhrEMgopSBCzR0EbUl
 EIAPYjZ8YbJzHnPHKpF1Bcwyt+YhCk2R22albI0+FCyTXPs9FZrWThpbSCPZKg3FWn1T
 0/IA+899nzx/2EZqyvckdrw9NwSqORgSNWvc6Va3J1w883R9blQnuIoWDZcFCBpiShKZ
 mkiRwkMmbfJF60MDSfRk6ADz6XuIhpb3SWY5q5cCnjE7uG4MW4LsfQYignb4LYuea4k3
 rPaIT5wJokgyKsO8vM+s/e0SL/KTV/mZWgeTCs5zgh0KRL2TCEz4+0dxONFiWjE32C9m
 G/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793166045; x=1793770845;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=KPA9q31D7UkjqcHAwkHe6GQHFQdyeJwK78n0ENxvic8=;
 b=rhxXiQHE16gLR5S8bvYBl7saUP8ilIsWG1kI757L0UJCfi/Qg5/4t5qChqBG7vVtTF
 YeVFhlPRdVhhnWxPvxj8LCKb2pb/+XOHLJo85c1L9daePJnLfwlz9f+og+QhhvKylo1n
 NphjjtW0FJ67HMOK+oesjFSdnwv+AaTCiewfQ7baG/DYvQBtNoFHO7hXe/qbGIY+Hzb/
 znySMrTn4JdTyhXS/a83JjNyPchvGUc7GTC9i8MSIysVmZ0qWoTf6rMcIr4cNOCQan3H
 jjzwpm+yoO53ICZkO5QJgTFvJBQEeC180i+STY3n/KKNZAx28q8SHX2Q9x7WtHczw0uF
 GIhg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzyK/FMPzVzF7fsbjBajiEKkuqnREMyLpCoQF89jOtGhu/Yx7YHB9Q0V4vJbr7x/xrKMzSmHS3/gE6t@nongnu.org
X-Gm-Message-State: AFq9FYLKfmqQNAPGsf339hqQnc9yS7jcQnojUtXB8lfj+D0kDq+fpgX+
 YZfMw42PbMtuF63UHX9U6+6KCzVcXoSkLhkBW9PxZDCN++sX7w6Pnc93IR2YjV8Plpv4S3VuGQ3
 eIAyDD0c9MkkLRM9hKW47UWsjXgN2HZbU+Pv5tadbeo6yv0C3grxv55aG91jQ9kAQsA8JOvYdcz
 +A8kZ5toeJaM8isP2vjE47C1R3MHUUCA1OtKH8IFzq03s=
X-Gm-Gg: AYBFou1ADJo3D63GYR+qoFRKwNZT75GxUAmBQgCd9fjl/D/nC8lf/lANVUnGl7TFP0m
 PiVwik3tJuhINdeYonqx8f0em+KnobG7pps84t0v7FIhEdrgcR+1fFWTmpv8mzCOdU5yNGBkLI7
 KpZCsbSlJeMpBedYuJsLaP9lpUM5ke4r2Y8PEN3JtXpcI7xWu1efevYRhdfSaOBn+wrL1MvPgQW
 EN9NZnVdosu5CpoW7cF4rt9mad+HMfM8Piq381K3by72/U/96/9vFwgd54eNcBy0KG6D7R7nEMc
 QKjpLpz4Ubtc7Rd40/nyu1tdXauK3To+wF4WIG2l6YxuMuoT8Hh4w9HcvoM63eOEkb6z+9HRBuI
 zHoTjYdIquDtQWmtVmo719OPoHu3CAY70EYBzbFI4Pe/rzid+PZN0QY6Z2rTyGNvo5BnI0z1TGa
 Qs9bF7k5lr6wuZjME9LE+t1E1ilIe9a2cFlJocrTzsved2E1C+FtzgTV090/ZPQfij+JbmgDDDv
 919d949hSqpeIQgash3hasu4u9SxWCiyE8fWahbvRndp7pvtGBFU47j8XA9XRMxxox6cn2sWmyJ
 gRk3HoenL2AH3o00A9erv3UZ5NeUsqIFT/lULlLWrAjqqqMsamHXKkqcC3PRYzwkT3s=
X-Received: by 2002:a17:907:9621:b0:c25:504a:1e25 with SMTP id
 a640c23a62f3a-c49bdf395c8mr100167066b.13.1793166045323; 
 Tue, 27 Oct 2026 22:40:45 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c49954c8ff1sm316650966b.78.2026.10.27.22.40.43
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 22:40:43 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6afafc89b48so1049696a12.2
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 22:40:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBwD5AuOtD8Pnmczve9lliEg2PN1kgZjwPzTxVXgUAMzJZxAu1G0WLavFvSGd2afjlKT1/5q95xjp78B@nongnu.org
X-Received: by 2002:a05:6402:6cf:b0:6b4:35af:3264 with SMTP id
 4fb4d7f45d1cf-6b49cc1649emr493263a12.38.1793166042821; Tue, 27 Oct 2026
 22:40:42 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
 <20261021231346.2452179-14-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20261021231346.2452179-14-daniel.barboza@oss.qualcomm.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Wed, 28 Oct 2026 13:40:31 +0800
X-Gmail-Original-Message-ID: <CAMXXpfZ=boFJCfv-xFmQBW6yvyH+yUOze64NiOOY0n=6cCDT=A@mail.gmail.com>
X-Gm-Features: AclHuK-bveYOpSJSxQxMYWxD_z3F6AccK-rf-BN-LnyhnzSHBOuCbRGcWLexR5k
Message-ID: <CAMXXpfZ=boFJCfv-xFmQBW6yvyH+yUOze64NiOOY0n=6cCDT=A@mail.gmail.com>
Subject: Re: [PATCH v4 13/18] hw/riscv/trace: add format2 msg helper
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, antikostya2@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="00000000000001793a065ee0018c"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=jay.chang@sifive.com; helo=mail-ej1-x633.google.com
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

--00000000000001793a065ee0018c
Content-Type: text/plain; charset="UTF-8"

> +size_t rv_etrace_gen_encoded_format2_msg(uint8_t *buf, uint64_t addr,
> +                                         bool notify, bool updiscon)
> +{
> +    RVTraceFormat2Payload payload = {.format = 0b11,
> +                                     .notify = notify,
> +                                     .updiscon = updiscon};
> +    RVTraceMessageHeader header = {.flow = 0, .extend = 0,
> +                                   .length = FORMAT2_PAYLOAD_SIZE_64BITS};
>

Shouldn't the format field be 0b10 for Format 2

--00000000000001793a065ee0018c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIGdtYWlsX3F1b3RlX2NvbnRhaW5lciI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xp
ZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPitzaXplX3QgcnZfZXRyYWNlX2dl
bl9lbmNvZGVkX2Zvcm1hdDJfbXNnKHVpbnQ4X3QgKmJ1ZiwgdWludDY0X3QgYWRkciw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBib29sIG5vdGlmeSwgYm9vbCB1cGRpc2Nvbik8YnI+DQorezxicj4NCivCoCDCoCBSVlRy
YWNlRm9ybWF0MlBheWxvYWQgcGF5bG9hZCA9IHsuZm9ybWF0ID0gMGIxMSw8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAubm90aWZ5
ID0gbm90aWZ5LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoC51cGRpc2NvbiA9IHVwZGlzY29ufTs8YnI+DQorwqAgwqAgUlZUcmFj
ZU1lc3NhZ2VIZWFkZXIgaGVhZGVyID0gey5mbG93ID0gMCwgLmV4dGVuZCA9IDAsPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLmxlbmd0
aCA9IEZPUk1BVDJfUEFZTE9BRF9TSVpFXzY0QklUU307PGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxi
cj48L2Rpdj48ZGl2PlNob3VsZG4mIzM5O3QgdGhlIDxjb2RlIGNsYXNzPSJnbWFpbC1wOGk2ajBm
Ij5mb3JtYXQ8L2NvZGU+IGZpZWxkIGJlIDxjb2RlIGNsYXNzPSJnbWFpbC1wOGk2ajBmIj4wYjEw
PC9jb2RlPiBmb3IgRm9ybWF0IDI8L2Rpdj48L2Rpdj48L2Rpdj4NCg==
--00000000000001793a065ee0018c--

