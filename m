Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B192C36008
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 11:27:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1txOug-0006P4-1x; Wed, 26 Mar 2025 07:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1txOuP-0005vS-3j
 for qemu-riscv@nongnu.org; Wed, 26 Mar 2025 07:26:57 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1txOuI-0006Iy-2O
 for qemu-riscv@nongnu.org; Wed, 26 Mar 2025 07:26:51 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso35042155e9.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Mar 2025 04:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742988408; x=1743593208; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7g2IKnrBrJG+N9GY0A6+8nTLCF+vCW3XpzFaL6k+rbk=;
 b=RUzN208g7h3kaD8LK2lUYtCF29lM3SPRHl6UQbJtC926xr0pqLevBjwkN+WB6YgN75
 1XhNiCSh0xeQKbfV4YS/1l2HiVVdBJjLcFR/nwx492+VSrnGJanqVrMXyWsZOzD7cSur
 FSXmwlzVCgnuJQNfo6Ughq7m9u0kJn829WrayAzw7hRHcbpMsFAGFXI+lmdtq7EA1xLd
 41zIWi0kRt8BAS1I6MzOgtYU8VYMkRg4dhHpffHa4sJwUNr5d1gfXqGBNjCg68H27ZfN
 K0ntj052eZ1jM1OSpHJax+fe7zVv3/JnWDxigka7K4IyJ47TAy0GVXlIcFoQxTX9H++7
 Q3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742988408; x=1743593208;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7g2IKnrBrJG+N9GY0A6+8nTLCF+vCW3XpzFaL6k+rbk=;
 b=fFuRIcpv+cLGdFF1D+mhMBFtLvvDSO6l8jTu6MJ7rkMvnINhG68tQotJJ7Cimg48Yh
 mUxl2GOsWlkQAmYqtJn7jn/rdHhc54ru4Rqa5RK82SnDkVvY4/+AUXgzClON/BguN4ii
 NA56Ulg4K+4Z/FXDxoVjdeGW/v+dtrmsytCfT62O7QWf9DDr0RNNb6cc/Hnep+4VdsaL
 RwPxWFkbm/84A29vu/VsMInSaTkur8SGqTdh5SnmI4uyPXHKn/+Pd3sNrytpwuIYKvbc
 eEzrPmlfjuynXrXFbWQNPxfMxVDb9xWLAdLGDxNoRbG/CfTVgNDCzlAqp4maZYV6wC2T
 gYew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvqTGUk1ZtdfxobJUb+3acIYiAf9rCANAJFuauSlf6//zfwarag0pGQeqrjX8OZClLeF//3Vu7UH4l@nongnu.org
X-Gm-Message-State: AOJu0Yy4gBi3ZGjxYNmHtH3jnytnKL1P+ddTSlK0yQcU6MSD95v947tk
 UEBjJD3qn/OxJxiwLwretM5nADjZk+oOcHzELBE9M477EDDjdyINfLLyptxQp9k=
X-Gm-Gg: ASbGncvTDavAgdQQxnfc4YqE1hHFr2uOn4WD8evEd4v456Sv6ffAmGL+DZUCwgFP7OC
 Ip2wyzqZZyYCiAFCPak5iPccxY5x8CcpGPI7TzDqcC47zksqQbxd7m7H+S2m/nvJ29sqb77dQzJ
 SQCN7TjoocRq77tNCvVS1a6wDc0x6Dsm2X1qiLQJutLCvPlfjhLBMYA7oFIDR+zsYAOxxcIP4nd
 hXVCEM95/HZmBvRdDGCIpCXBSkLZChQyx6Kq/5dqlBxVKmT77vns/mnwmNMMe7I88C6UlSy+KY1
 Q7QHrAIUODrdfPsuAM0tumf+7OLwMChqdzGerr+Asln4pe8=
X-Google-Smtp-Source: AGHT+IES2Re9pQalUvHFOUIYdRBm5Y1Mc23ubaKSfKumPKaNKusbkFVeGI0CfdWa28ukFmWzNyDulw==
X-Received: by 2002:a05:600c:3155:b0:43c:f81d:34 with SMTP id
 5b1f17b1804b1-43d509eae2dmr169841015e9.9.1742988408129; 
 Wed, 26 Mar 2025 04:26:48 -0700 (PDT)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fceafacsm183483745e9.6.2025.03.26.04.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 04:26:47 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id EFFAD5F90B;
 Wed, 26 Mar 2025 11:26:46 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Zhao Liu
 <zhao1.liu@intel.com>,  Alistair Francis <alistair.francis@wdc.com>,
 qemu-riscv@nongnu.org,  Anton Johansson <anjo@rev.ng>,  Daniel Henrique
 Barboza <dbarboza@ventanamicro.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,  Weiwei Li
 <liwei1518@gmail.com>,  Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: Re: [PATCH-for-10.1 v2] target/riscv/gdbstub: Replace ldtul_p() ->
 ldn_p(sizeof(target_ulong))
In-Reply-To: <20250325154913.95283-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 25 Mar 2025 16:49:13
 +0100")
References: <20250325154913.95283-1-philmd@linaro.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 26 Mar 2025 11:26:46 +0000
Message-ID: <87tt7g118p.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Replace the few ldtul_p() calls by a generic ldn_p() ones.
> No logical change.

Queued to gdbstub/next, thanks.
<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

