Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA97CC4167B
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 11:49:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rE6hP-0007Eh-KC; Fri, 15 Dec 2023 06:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rE6hO-0007EV-69
 for qemu-riscv@nongnu.org; Fri, 15 Dec 2023 06:49:46 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rE6hM-0004b2-2b
 for qemu-riscv@nongnu.org; Fri, 15 Dec 2023 06:49:45 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c339d2b88so6012945e9.3
 for <qemu-riscv@nongnu.org>; Fri, 15 Dec 2023 03:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702640981; x=1703245781;
 darn=nongnu.org; 
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=tKtJ2OE/HydtSsQxET8jKu49uC7GR6jEhkuZ7idIOMA=;
 b=pgJgvOU0HnyrPMMXPZsd/Mrm3XBfz79lYVR2DWNzW63f9a1x68MSoMtQRuJsztNe+k
 w5Af//xMRZ4rEH1D8HzCTkrT0Kx44bfHdFTsTE619PNLbmpjRqiCkm6UTNSehEa7oXnW
 aaGuXBSLtc0IWOdGXxZo3RZeKfuWuZsg5j1m2Vc9hcQD38WoRBTHHtTfVdALOJXt0zfB
 tS8xeh57sOa0uKmLxTqEC5+Diq6z7o7zuWQnJi/j45ngl7zM0FqQIYgJue7XnoLuKIgK
 Kw+EPYxKpIeP8v4jmsgYMHMOCJzVlx7dgi6KKxPSFxE5N0J1mZg9UDp4asEM6EFsOLRl
 XwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702640981; x=1703245781;
 h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
 :subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tKtJ2OE/HydtSsQxET8jKu49uC7GR6jEhkuZ7idIOMA=;
 b=o7Z5vBMz/Kx+JsDIAXBPR5y6tAQxR/Y+LBWUDCu43FgWiTOYXGs8KzcZj6KcqW7raI
 G8/j9YncQfvsIPyjtSLvuL4YDDC8/vXio1jtu3f1PJ4M+ck+2VEVgV6RT5flTXGgYdr2
 ruMxrwB/DmygR3fZmBGqNZyXLGkelofMQzh2J0VTZCfwUC71xguG0eogVraT6lXlo+K7
 ITDc8Dyc4b9njjNfNPXdESJqYptyYpTjf8uWoEZ1CRoSe/zJzbByF10DS3Qp22hfQ70k
 sjsMtgWSol6BfGhhtVGrOihoAH75mS2TQnWUsfhomTQxkuTle+iAhTAASxbbw4jbJKa2
 VA2A==
X-Gm-Message-State: AOJu0YwL7r4iMBEZ369K21eDXFiBsymN7EHqTWeSotOsFL2QcTnSSJMm
 MNm08fQQdQL0GEiRQH1uyn+ai4Jd7E525XFtbdO59Q==
X-Google-Smtp-Source: AGHT+IGKDSyD6gFsN+tXBEQ8vvEKFcO8OhWu/0pZjnunskX44nwg/iteUUatR3AvrU2xKp9yj+21zA==
X-Received: by 2002:a05:600c:1688:b0:40c:1db4:3a53 with SMTP id
 k8-20020a05600c168800b0040c1db43a53mr5466035wmn.157.1702640981442; 
 Fri, 15 Dec 2023 03:49:41 -0800 (PST)
Received: from [192.168.1.9] (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a05600c191200b0040c6b667dccsm1887692wmq.25.2023.12.15.03.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 03:49:41 -0800 (PST)
Message-ID: <b815ab5fdf33d9b9000c8165d50d000f387a3463.camel@rivosinc.com>
Subject: Vendor CPU overrides of non-extension properties
From: Rob Bradford <rbradford@rivosinc.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-riscv@nongnu.org
Date: Fri, 15 Dec 2023 11:49:40 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Daniel,

Thanks for your work on improving the extension handling for vendor
CPUs. I have a query regarding the correct way to override properties
that are included in the "cpu_options" list as part of the vendor CPU
initialisation function.

i.e. these properties:

Property riscv_cpu_options[] =3D {
    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask,
MAKE_64BIT_MASK(3, 16)),
    {.name =3D "pmu-num", .info =3D &prop_pmu_num}, /* Deprecated */

    DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
    DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),

    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),

    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),

    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize,
64),
    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize,
64),

    DEFINE_PROP_END_OF_LIST(),
};

I think that these values should be specifiable as part of the vendor
CPU initialisation method however unfortunately they are overwritten
with the default values from the properties as
riscv_cpu_add_user_properties which adds the properties is called from
the type post_init method which is called after the vendor CPU init
function - so any changes to e.g. cfg.vlen are lost.

I would appreciate hearing your thoughts on how these configuration
values can be set for vendor CPUs.

Cheers,

Rob=20

