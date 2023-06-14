Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEF3EB64D8
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 13:02:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9Q7s-0002qT-1M; Wed, 14 Jun 2023 09:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1q9KCN-0007Jo-Nm; Wed, 14 Jun 2023 02:41:44 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1q9KCL-0000c0-7a; Wed, 14 Jun 2023 02:41:42 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1b3be39e35dso30625685ad.0; 
 Tue, 13 Jun 2023 23:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686724897; x=1689316897;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gcV+Gc/EtyuGw7zxJaRZXKDWNjiNm4hfNFwOQuu7t6M=;
 b=Jj+Ebt5xU8wjFVSxzG/q8SYoHPELz+MpW/TgKSC74SWLJK44Csm6z5mK3u91l23azQ
 j/EvlznN1RprEZpSMeET7W/KHY14H2dPILWH+wCR2LEBZLykGdJXOl/kSdRXMXn8XlaE
 hhIooBsMzFZ5Hh1agh1YhPfK8wbyo0AOJvWjIO5XY2w5osG39f9c0W2M9SrxpCjnrF8x
 oPxP1/rGGj+FJNbs59GZZkgBxgaoe+vXrpqpnud/EwOqMZiIGPUCRgspl1CJmMZ1AC9E
 USk55b9S4Esj4urvStwEeZWhgWeAykbxu4NtNgamilcnnLyRZ9HYwa1ms/mfdQBR0s0K
 KQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686724897; x=1689316897;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gcV+Gc/EtyuGw7zxJaRZXKDWNjiNm4hfNFwOQuu7t6M=;
 b=KP3Nqv86YfYIKtVpF3lf+yR5eSkevOn5KO09HPcuo3U0sJh4/CM01XDcqSuHCmkYNK
 gYIek+FU/w+Nbq5MukB2NlcJne3dEVy9IMmEau0yp/IYFP1RhmjdYVrx3CrMzGn1Wg+K
 DbOj0XWzvqZmTiViiFn91EkB8MgKD93TI8HzDr0KIIaBvp145LFHHMVF1OEAVkeBXwbS
 Ne0Jeq4JKP9oFn6/ou7dWRMZR9rggYHHyPj+defwHdXbA5ZCRmdU+HbYhATddDLZ8AWO
 Ano+mlkHaBG8FbXmGfnSFLbQss2OB6CjCS6wjHUwHG8t+v1WhyDUCopAM07EmYsQDOjE
 fJBg==
X-Gm-Message-State: AC+VfDwp+LnMcp8Ybs2SKccFYWaC3gZa9BJHhVoYg1FXYmaIoFgcFr6/
 DH2Ime+fj/kjBgboO4t+U0Qf28wvowhWOA==
X-Google-Smtp-Source: ACHHUZ5oShB3ijo9wApqyIzvoJ3/fmeaYGcnQ4Di/sgzdLiwxqBFgHRo9o22tHzUYScXPviTXtpu6A==
X-Received: by 2002:a17:902:bc8a:b0:1b0:6e16:b92c with SMTP id
 bb10-20020a170902bc8a00b001b06e16b92cmr10865713plb.54.1686724897393; 
 Tue, 13 Jun 2023 23:41:37 -0700 (PDT)
Received: from localhost (14-203-144-223.static.tpgi.com.au. [14.203.144.223])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a170902ecc700b001a69c1c78e7sm11429089plh.71.2023.06.13.23.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 23:41:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jun 2023 16:41:31 +1000
Message-Id: <CTC62LQ76F2F.IT4OWO0UXG4F@wheely>
Cc: <qemu-block@nongnu.org>, "Thomas Huth" <thuth@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-riscv@nongnu.org>, <qemu-arm@nongnu.org>,
 "Richard Henderson" <richard.henderson@linaro.org>, <qemu-ppc@nongnu.org>
Subject: Re: [PATCH v3 0/9] bulk: Replace CONFIG_SOFTMMU by
 !CONFIG_USER_ONLY/CONFIG_SYSTEM_ONLY
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
X-Mailer: aerc 0.14.0
References: <20230613133347.82210-1-philmd@linaro.org>
In-Reply-To: <20230613133347.82210-1-philmd@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 14 Jun 2023 09:01:26 -0400
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

On Tue Jun 13, 2023 at 11:33 PM AEST, Philippe Mathieu-Daud=C3=A9 wrote:
> Missing review: 1, 7, 8
>
> Since v2:
> - Rebased
> - Added R-b tags
> - Rework i386_tr_init_disas_context() patch (Richard)
> - Dropped RFC prefix
>
> This series aims to clarify the CONFIG_[USER|SYSTEM] vs CONFIG_SOFTMMU
> confusion [*] by using explicit definitions, removing mentions of
> CONFIG_SOFTMMU in non-TCG code.
>
> We replace CONFIG_SOFTMMU by !CONFIG_USER_ONLY in C code and
> by CONFIG_SYSTEM_ONLY in meson config files.

I like the change in general, SOFTMMU does not read well (and is
not exactly correct for system code as pointed out).

Sorry for chiming in late and if I missed it, but was there
a reason not to define a complementary CONFIG_SYSTEM so system
code does not have to test !CONFIG_USER_ONLY and invert a bunch
of the tests?

Actually I thought you would have CONFIG_SYSTEM and CONFIG_USER
options and the _ONLY variants could be derivative for convenience,
but I'm probably missing some detail.

Thanks,
Nick

