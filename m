Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06BFC4345F
	for <qemu-riscv@archiver.kernel.org>; Sat, 27 Apr 2024 15:17:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s0jo3-0000JK-IA; Sat, 27 Apr 2024 11:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1s0jnl-0000FG-6W
 for qemu-riscv@nongnu.org; Sat, 27 Apr 2024 11:17:22 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1s0jni-0005sl-Jd
 for qemu-riscv@nongnu.org; Sat, 27 Apr 2024 11:17:20 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56e1baf0380so4233792a12.3
 for <qemu-riscv@nongnu.org>; Sat, 27 Apr 2024 08:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1714231037; x=1714835837; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7pZdRtxVJQLoQwmA7i6C/gYkN8D0jZJUZbjmfuMYhHk=;
 b=TDbX8J7v4E5c+lAYLSAbHpQonDH+gQkUgh6T7LA4z8g2aWa4+R5tXIf4ri8QR5mytN
 mEBy0CbBXOGXJlOZ4Yk8dixO+eN3Ier5PSPuBNCmbnsiO5Fw3YM0dpYdui2xmf7UJiIf
 D4RwQ0BZK2NVv0NYvi41JDwRZzLWtxaC+Ru/X4Z0g2Hx97VJpZT+Zytse8RSTPQ4ok5z
 m+hhvUoB9xX2Z7jfQ09IB2g5yUUGRvQQ8ALDaibP0yZRkKKlfYUy8yRgXcjEoYNWkh78
 51dbJisVMsbJvLmuecSjkQE7zMpTJ1qsgZnmB7hllNTEY+Vvn25RDsorWw7pS5rgUD7R
 QU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714231037; x=1714835837;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7pZdRtxVJQLoQwmA7i6C/gYkN8D0jZJUZbjmfuMYhHk=;
 b=nGzvMLatukh2kZeisLv36XtrmfkQWYuuKUD+Q16BjC83DmJCdayTocagT1hF6i9DqJ
 Qdp7QSYCdBcUeLD64HY61FG6OqgocWeMRuOY+KvNY/XUihrfy3xLBwKQS353xfNSeXDG
 phPbnDhpKPnbedCBkGSR19AMdbyaN0P9NY1yOa7aqgpfPrj5QKNBwxTHOUsCpwsLycMG
 7cLsyfIT5mfilEczkxgsWeR8iod0NyZILZM9CEbD5v+z4ms/PR1UWfr9yzTsWabe3BG2
 vA4IU13kDCmtZE0EHc1Oer1vCxUAVRtrQZcs6zZvHNmQQ0ifKiUXvxIuqefTgap1CRcq
 veIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpynkqVBugfL/o5tU+PSI+PMLtT+RnrctkZ+OnB5raNTN+AWBURESDyfK2otKHMbTaGUe8xFyWN57V57aVzxCtSmxkRAE=
X-Gm-Message-State: AOJu0YwwNbGr9Ne1aQgKK+PrtKBWnc/qwNzZUMnaA2z/L+h2G7iJby4d
 Uc64Kze7AKm/LVCSysRxRukOFU4GezOCQ9+2ROUr8C7jtmQYoonF7Ae74G/UVbc=
X-Google-Smtp-Source: AGHT+IGK/xxdHKf2tegdNXk7Hthxw0QyKc80IiXI+4/LiDfOChBiqvl3aVMODq5oq4XrFbL88CTVDA==
X-Received: by 2002:a50:871b:0:b0:572:1b5a:2a07 with SMTP id
 i27-20020a50871b000000b005721b5a2a07mr3244319edb.32.1714231036544; 
 Sat, 27 Apr 2024 08:17:16 -0700 (PDT)
Received: from ?IPv6:::1? ([2a00:11b1:10e0:ce92:d96d:c66e:ee2c:b710])
 by smtp.gmail.com with ESMTPSA id
 ig1-20020a056402458100b0057272ff56f3sm271049edb.93.2024.04.27.08.17.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Apr 2024 08:17:16 -0700 (PDT)
Date: Sat, 27 Apr 2024 17:17:09 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Michael Tokarev <mjt@tls.msk.ru>, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 qemu-stable <qemu-stable@nongnu.org>
CC: greentime.hu@sifive.com, vincent.chen@sifive.com, frank.chang@sifive.com, 
 jim.shu@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/1=5D_target/riscv/kvm=3A_fix_ti?=
 =?US-ASCII?Q?mebase-frequency_when_using_KVM_acceleration?=
In-Reply-To: <97934a65-f62f-49e9-820b-07463c3029ed@tls.msk.ru>
References: <20240314061510.9800-1-yongxuan.wang@sifive.com>
 <e841b1ba-1348-48ae-89b7-bfa14ff8e70c@tls.msk.ru>
 <2C907355-C0F4-4C7F-B37C-8B4371A57B00@ventanamicro.com>
 <c174a8cd-4a53-4a28-8688-aa62c7eab45e@tls.msk.ru>
 <97934a65-f62f-49e9-820b-07463c3029ed@tls.msk.ru>
Message-ID: <896AA0CA-E83A-402F-8A07-5BBA7BEF98F5@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52a.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On April 27, 2024 9:24:04 AM GMT+02:00, Michael Tokarev <mjt@tls=2Emsk=2Eru=
> wrote:
>27=2E04=2E2024 09:59, Michael Tokarev wrote:
>> 27=2E04=2E2024 09:23, Andrew Jones wrote:
>=2E=2E=2E
>>> It's possible to cross-compile qemu, so it'd be good to add that to th=
e CI for riscv until we can add native compiling=2E
>>=20
>> Yes, definitely=2E=C2=A0 Qemu is already being cross-compiled on all "o=
ther"
>> architectures during CI=2E=C2=A0 But it is also being *run*, not just c=
ompiled=2E
>> And this is what's broken on riscv64 for almost a year now, and this
>> job has been disabled=2E=C2=A0 Instead, the *run* part of this job need=
s to
>> be disabled, but *build* part should be kept=2E
>
>Aha=2E I was wrong=2E And I was there before too, for sure, - just forgot
>about it=2E In order to be cross-compiled, the cross-build environment
>needs to have target -dev libraries, not only the cross-compiler=2E
>And this is where debian riscv64 port is failing=2E
>
>So no, it is not currently possible to cross-compile qemu at least
>on debian without building whole cross-environment with all libraries
>and other necessary stuff=2E
>
>I'll try to use debian riscv64 porterbox to at least verify the new
>set of patches we'll pick here to fix this breakage, at least compiles
>on riscv64 :)

I wrote instructions [2] for how to cross-compile without a full environme=
nt/container once=2E It might be better for quick, local testing=2E

[2] https://lore=2Ekernel=2Eorg/qemu-riscv/20230726120706=2E335340-2-ajone=
s@ventanamicro=2Ecom/

>
>> 10f86d1b845087d1 isn't sufficient, since it relies on 450bd6618fda3d
>> "target/riscv/kvm: change KVM_REG_RISCV_FP_D to u64"=2E=C2=A0 In the sa=
me series
>> there also was 49c211ffca00fdf7c "target/riscv/kvm: change KVM_REG_RISC=
V_FP_F
>> to u32" - is it also needed?
>
>49c211ffca00fdf7c is also needed=2E  So it's 3 so far, still not compile-
>tested=2E  Anything else?

Those 3, the first of the series [1], are good=2E Not sure why it's still =
not compiling=2E

[1] https://lists=2Egnu=2Eorg/archive/html/qemu-devel/2023-12/msg01132=2Eh=
tml

drew


