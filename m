Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C47C5B572
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 10:05:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuSIq-0000cO-Qn; Thu, 13 Aug 2026 06:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wuSIp-0000bp-1S
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 06:04:47 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wuSIn-0008RA-HQ
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 06:04:46 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-81ea0b7d137so5167627b3.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 03:04:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786615484; cv=none;
 d=google.com; s=arc-20260327;
 b=irGy5AEfkEf3uK46Ede+ZRRTOZrRdkWAWrj/peyyhTR8a6GkdOHYlH1KMA8itLgSaN
 zLbBnAdLMOEAaHobTwx3t1nityOpEKkq8AttBIyWlOvjX8GwSHiMs2+gzQDY7d1gu/F6
 LzUgZsUZEOIjjzq68wZXAB2m2iiBGbLnTVNJiOiZ/iH97xP+Z8Ypc6w4I6qWtpDuAHzD
 LwguBNgJNH3U3IMsVF8GYgRQkAuiM25h9hjHCUvvxiWEZMrvuwWJYnJYaHexKcdd4286
 Q7IvZ4VSvC+uKfpIcX/i/lqq5hF+rjUCDWHqzeSlrWd597Jn02PbG+ElGokLNSBR+d42
 XtCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=onW2dnaF2GCB9RsEW/cJS52ANjiN85srWkj3FUbQj2o=;
 fh=CrzhILkUWph+ZdLOAJa3JEFcd1P4eUfy2GG1Ryk3mwQ=;
 b=n3sKAJvNpaYdCV3WqeHwlK9J5+7V5lDnO8zS0/wR0GtcRxh7iD4Lt1WndqlAxSjv0h
 xRpG0xcTy36VV8BpE/faqyuL1FrHL81ErUCplstAGZT2XGNYG/5pLv2lU0gTURuJt2eC
 e3ua/PDjJTth1CCbkGFW/d0+2aRD0A1jiujSy3mmyHxlnHFtbbft5jCP0RxM0iRTZMRW
 j3RP82rSuALAgzmChrf6E+vVOtKGsRVjyN+Os6VKl/b6POsGe5dSs/VIlRNI7BWPJfS/
 B/hUr01Xu0H/gO5Fxl01xkaXmPF4ZnKdK9GtVjrXqvp+RjZC0NFsaWc8K+KR8oYzfHB1
 bSnA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786615484; x=1787220284; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=onW2dnaF2GCB9RsEW/cJS52ANjiN85srWkj3FUbQj2o=;
 b=CGBbL8d1IZelqF9MQdiQD/OVdDiNqPgR5sJQknBTou++lhJ6+8c9occjC6vVmjUEWl
 8kfdCyd9ub8xBmlWg3qTAs7w2gtHkz3ZociNwlzz5NWL8Qfga0nM1h47r1sfX42pJlTR
 vMzKb02epWUpqSD77S+oUMwOtCZyxOsymchvCSNwM+iakjj96AckQ8W+oDjRr0cx9b7N
 VPhF9k0Dak4AzSOmICR2ZWR0veEP/QmDdm8PF6dfxI1j8b0RnWFoD3CoDEMEIbkggIij
 cCOJw4mRHCYdLSTjGj4Uy8CA//6X8O/9klyJ/lcZ6FUJIJuhgVDM31SVdRoRDCxv5zPH
 UMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786615484; x=1787220284;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=onW2dnaF2GCB9RsEW/cJS52ANjiN85srWkj3FUbQj2o=;
 b=MySsnf3F0YrgmwiHnFmd2pGIJcP5lfCCKpJuk/ulp6U7iIbq3QsXODfGxVk0112ZAM
 qLbz3/f9Tfl5piAAQW0GbvpEZoa4cDRMf8H5iZyFZKm2UMMuE10P51e99+TrS+bFSMzC
 hb5UqYTazNzzj96kn4IhuJWbdO/Xv0tkpG0JEddBTowNZlbgoJFFMtWGVTk85NWrgsbe
 s7OY4Ep/OQRd9sLsvj9TanmhtqMG/ZlNRpxzh4ZzxS+B2vETdC4tvb/RA9uoDcY5cPPv
 dn1iB2Pbt/GBU//FSGyIza0IuTr+Ywku+LBzK5gJBXa+NV1ROA+qZucxrAloAlVsNme8
 jfIQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpvodPOxjqingwEm/IjC4ham+PM5yKI/ziweQmwhc9ofAG2lIuCe7Oh3QuIlQ88NNjAYmPgrJPwNIn7@nongnu.org
X-Gm-Message-State: AOJu0Yx4M95JrdQkZQAt+3QCnkutg+8t7Gw8wMWN+OM7fA4Z6CLYkGkU
 VxX3pz0YhElO16onhJpN+ImSKOfN1WdSzp/poNr6PHez/0HhpFt6FT3kMk1G4Spa1IKzoQBX3MT
 /Ib6vtll60EVjFF2gNYCTtBJmPAWViAs=
X-Gm-Gg: AR+sD12kjAkgyEFfmLTro3MeXMReKGBhJtDNxC5q8FprCg5B0uA9fGGuKAQOKqp79tJ
 eCX3k3YVn6BmYGLFOOcCiIcdMVR6SIjsSqV8MEydpUtLq9C+EK5hHpMWxr8UQrpZRBL0PfCVkZQ
 G95ycKW5wxNuhcrHhY7yBVmu9+roaLMkyQ+wYmBqUb+wfoM3/PxrGs9X+ICHv8eo56LV5SmEs46
 Skv/VKyZA/gZzN/MPYZxKtvlnQz2HxJbW1dIkGBJYpeWPtFRtbLP8MS+rGQkJPZMws7joNZb4G1
 y7pilfBD/hdGzTzkbz77n3DKkU+Y3Bwi2GR09WPzuqah06mj
X-Received: by 2002:a05:690c:397:b0:81e:a3a0:701b with SMTP id
 00721157ae682-8347181ef65mr21737977b3.9.1786615484002; Thu, 13 Aug 2026
 03:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260813054329.35425-1-chao.liu@processmission.com>
In-Reply-To: <20260813054329.35425-1-chao.liu@processmission.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 13 Aug 2026 18:04:32 +0800
X-Gm-Features: AUfX_myMmBKgRtscE2ficTPYlRhCK-lMKXUnysIcc8zt8Bxxh_vnsjbLeTtfE3k
Message-ID: <CAEUhbmUqMbnqWXuxn-FAV5YXofMuc6+L=aGuc=YmF7e=BBMUDw@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: remove trace output from k230 watchdog test
To: Chao Liu <chao.liu@processmission.com>
Cc: alistair.francis@wdc.com, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, bin.meng@processmission.com, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Aug 13, 2026 at 1:44=E2=80=AFPM Chao Liu <chao.liu@processmission.c=
om> wrote:
>
> The interrupt mode test does not depend on trace output, but passes a
> trace file to QEMU. This makes startup fail when QEMU is built without
> the log or simple trace backend, so qtest cannot connect.
>
> Drop the unnecessary trace option.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4126
>
> Signed-off-by: Chao Liu <chao.liu@processmission.com>
> ---
>  tests/qtest/k230-wdt-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

