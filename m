Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42095C04A94
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 10:48:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qVV7X-000744-7F; Mon, 14 Aug 2023 06:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVV7Q-00071r-Tp
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 06:48:16 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVV7O-00088m-NS
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 06:48:15 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-31768ce2e81so3759526f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 14 Aug 2023 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692010092; x=1692614892;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LxLZKLEQvAnUN36RxqNEU5N+4uqPL2AVJzYAPj86+RI=;
 b=M3u9bcbnJoK04BcqSxunO51l34VCc6L2R0h/fE9LT+taN10e5RZsMrrvdWOGjt7pcs
 Pv4dxZ4Iz4KO8QQ8HPPQGtNPxlzkurdua1dm2HpbrDNWTnbP5hkjTcNeprqa+bV8IJjv
 qbPDGwnU01bXJk1riwSvFKqOTsz7tj9iG1jkeiVNXJwfH4TDr4z4ixLJvCIRunccOSNO
 QUdhn7eYglhWF2lUqCqkFuBo5n+nW8O3bqGwSj0iwv49zr6w6/FvWA52hdVHtv0PATco
 sgs09Q82d8S7AzHKcIOiCVWwtdLLd99UAhw1DdyZy5bs5WeVZj+ZrBQ0DQ2on2owvI95
 kMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692010092; x=1692614892;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LxLZKLEQvAnUN36RxqNEU5N+4uqPL2AVJzYAPj86+RI=;
 b=HWITw81krbbi4M0sZEOqt76vioip6FEjimhzeV0OUndMDeAtVSZmstWEXwSlznW5XK
 DnEMnLQcozHoydhzxxMNa7g7Nqez4wWM1cAPsfmtfqKcfPjzj1RUjT0t9EA0Fie+J+iN
 zeU9yZdOTvIzbY1gx6wkKdOOPAPr27QrDuGRUdz0xspGwr844ZdRunH1e/0HmICBfHom
 CKPxLcF2yIorZYQdC9yFFvrN73CxiuPYlvMKjC8YKrXY+gmuLJKN/ZY6BrkxOwnLCukV
 THztYwq/n4ts8ab0S86ksuFrZj6r1sw+IKsR7iCAaq8DBZMaaOVIflL5tpgoBKsdgQaI
 ueHg==
X-Gm-Message-State: AOJu0Yy3yxbPgb8uJpEvkngvdfY+NIj6LYZ4gS2QrkLTkI4aZqVseh76
 x1igWB6a3L9hYtfb1NOiWZ/nKQ==
X-Google-Smtp-Source: AGHT+IGQo+tuIJ3DnJhsDNmYaXwCtHh+LZxMnxNWzqYxjXCGD3b0eQqiMAkylRtFvcpJQEMjyIacOA==
X-Received: by 2002:a5d:4411:0:b0:317:7081:34c7 with SMTP id
 z17-20020a5d4411000000b00317708134c7mr6798273wrq.44.1692010092418; 
 Mon, 14 Aug 2023 03:48:12 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a5d4947000000b003197a4b0f68sm2171393wrs.7.2023.08.14.03.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 03:48:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6AFBA1FFBB;
 Mon, 14 Aug 2023 11:48:11 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-2-akihiko.odaki@daynix.com>
User-agent: mu4e 1.11.14; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, Richard
 Henderson <richard.henderson@linaro.org>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Brian Cain
 <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, Laurent Vivier <laurent@vivier.eu>, Aurelien
 Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Chris Wulff
 <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, Stafford Horne
 <shorne@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, Nicholas Piggin
 <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Max Filippov
 <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [RFC PATCH 01/24] contrib/plugins: Use GRWLock in execlog
Date: Mon, 14 Aug 2023 11:48:06 +0100
In-reply-to: <20230731084354.115015-2-akihiko.odaki@daynix.com>
Message-ID: <87leedsxw4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> execlog had the following comment:
>> As we could have multiple threads trying to do this we need to
>> serialise the expansion under a lock. Threads accessing already
>> created entries can continue without issue even if the ptr array
>> gets reallocated during resize.
>
> However, when the ptr array gets reallocated, the other threads may have
> a stale reference to the old buffer. This results in use-after-free.
>
> Use GRWLock to properly fix this issue.
>
> Fixes: 3d7caf145e ("contrib/plugins: add execlog to log instruction execu=
tion and memory access")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

