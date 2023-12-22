Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B843AC41535
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 04:37:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGXHp-00025P-1L; Thu, 21 Dec 2023 23:37:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1rGXHl-00023k-Kf; Thu, 21 Dec 2023 23:37:21 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1rGXHj-0005gE-Pg; Thu, 21 Dec 2023 23:37:20 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6d2350636d6so1401449b3a.2; 
 Thu, 21 Dec 2023 20:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703219835; x=1703824635; darn=nongnu.org;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wgbOU8upAnXjTn1k3hXjDm0JM5y/8ovK8kdYS3DuYTw=;
 b=Ye05mDrBmLXe58F+0F3nhNU2Nzu22H72sStPxIDaOMhRv2+Ct2JY2WQgVvy3sUxEL6
 OjQiuJCWWugEiy1x08mzfx8zXenTKxm1VsUUWKOFe2Gpo9HoY+lWJBIPs3mrSHx6z0CQ
 +TafyazhYV7X4tNE5w5CdvocZJNxrxvCXW3ZlAyTqoz5Eij5zTFcGlUaT3KjPDg144lr
 zagoWRGPIevRHRn6NXf9Wf98Amp9S4Z6qbqjo514d/Lxv67pe5jc9hdM23eMiawxiYg5
 beeLYDei4NlVJLD0igvELEITPW8iBd2mV0GwZXniFNvFGfLjkUMBzbRZ4KqIjpulUWHz
 OK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703219835; x=1703824635;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wgbOU8upAnXjTn1k3hXjDm0JM5y/8ovK8kdYS3DuYTw=;
 b=tNX3nQjJHNDP4WPsiQzsbeVb5RAFhCKBgPV9zCfqrmKWEBPYYffneFtQ43gwtVRlvy
 fp2oMCfbxcBDl18jk67COmWr8IDU5Bd2i/ykOJB7L9MvDWkJal1kXFHMe+LLKa15OXYD
 GvQPx5CWnoV+4c/gStJbhqva2c/OAmnH98aA8lk3jHDTaFqr0gAQIaQkJGbxMlMWckv4
 AvJ/B5PQs98a+Jfj7J02/oPozMCGScK4L4QOlm9vwi0J+gafe+YudTJ93p6iLB8LI5GX
 PoAOrrVhvDhvsRp4wjhoGlRVMBnMxmWdc5PSbv/L+bAHzz5h3c67jhE1qCyyN7JTj3zX
 ujdg==
X-Gm-Message-State: AOJu0Yw2ETPmvq/tJaQNgdmnLPlnx493Re+kcFyx7c9j1bK22Hwac9pD
 8+LBfId1QkQuwgyvbpLruWg=
X-Google-Smtp-Source: AGHT+IEzGYteh6ju41xh+kmV2jHDL4x/LDbTHCYXHss7B6ob7M7088K9WAbPmSzEygfU90Es9K9+tQ==
X-Received: by 2002:a05:6a20:e11f:b0:195:306c:814a with SMTP id
 kr31-20020a056a20e11f00b00195306c814amr646817pzb.100.1703219835178; 
 Thu, 21 Dec 2023 20:37:15 -0800 (PST)
Received: from localhost ([1.146.126.39]) by smtp.gmail.com with ESMTPSA id
 o8-20020a17090ac08800b00288628acf6dsm2625274pjs.14.2023.12.21.20.37.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 20:37:14 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Dec 2023 14:36:57 +1000
Message-Id: <CXUL1AHC8Y18.WHZQSSFCJNWR@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
Cc: "Ilya Leoshkevich" <iii@linux.ibm.com>, "Peter Xu" <peterx@redhat.com>,
 "Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>, "Peter Maydell"
 <peter.maydell@linaro.org>, "Mark Cave-Ayland"
 <mark.cave-ayland@ilande.co.uk>, "Eduardo Habkost" <eduardo@habkost.net>,
 <qemu-arm@nongnu.org>, "Paolo Bonzini" <pbonzini@redhat.com>,
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>,
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?utf-8?b?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 <qemu-riscv@nongnu.org>, "David Hildenbrand" <david@redhat.com>, "Warner
 Losh" <imp@bsdimp.com>, "Claudio Fontana" <cfontana@suse.de>, "Brian Cain"
 <bcain@quicinc.com>, "Daniel Henrique Barboza" <danielhb413@gmail.com>,
 "Richard Henderson" <richard.henderson@linaro.org>, "Thomas Huth"
 <thuth@redhat.com>, "Michael Rolnik" <mrolnik@gmail.com>, "Song Gao"
 <gaosong@loongson.cn>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Aurelien Jarno" <aurelien@aurel32.net>, "Jiaxun Yang"
 <jiaxun.yang@flygoat.com>, "Aleksandar Rikalo"
 <aleksandar.rikalo@syrmia.com>, "Stafford Horne" <shorne@gmail.com>,
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Alistair Francis" <alistair.francis@wdc.com>, "Bin
 Meng" <bin.meng@windriver.com>, "Weiwei Li" <liwei1518@gmail.com>, "Artyom
 Tarasenko" <atar4qemu@gmail.com>, "Max Filippov" <jcmvbkbc@gmail.com>
Subject: Re: [PATCH 03/24] target: Define TCG_GUEST_DEFAULT_MO in 'cpu-param.h'
X-Mailer: aerc 0.15.2
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-4-philmd@linaro.org>
In-Reply-To: <20231211212003.21686-4-philmd@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue Dec 12, 2023 at 7:19 AM AEST, Philippe Mathieu-Daud=C3=A9 wrote:
> accel/tcg/ files requires the following definitions:
>
>   - TARGET_LONG_BITS
>   - TARGET_PAGE_BITS
>   - TARGET_PHYS_ADDR_SPACE_BITS
>   - TCG_GUEST_DEFAULT_MO
>
> The first 3 are defined in "cpu-param.h". The last one
> in "cpu.h", with a bunch of definitions irrelevant for
> TCG. By moving the TCG_GUEST_DEFAULT_MO definition to
> "cpu-param.h", we can simplify various accel/tcg includes.

Acked-by: Nicholas Piggin <npiggin@gmail.com> (ppc)

Thanks,
Nick

