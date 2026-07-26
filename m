Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB89C531FA
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jul 2026 06:56:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wnslf-0001A0-9N; Sun, 26 Jul 2026 02:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wnslV-00018W-UV
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 02:55:15 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wnslU-0007wO-Jt
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 02:55:13 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2cf110997efso4121245ad.2
 for <qemu-riscv@nongnu.org>; Sat, 25 Jul 2026 23:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785048911; x=1785653711; darn=nongnu.org;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=yQcSsWuGcuYv9mWdw2DlPMe/MrOO7NK+HgvDmXGBT/E=;
 b=fh4fUUYTgZprgSi96miVktxF2f805wyH/7QDxu0/HvurCFh9dcoISsCvNQQPX4LYEj
 PQwHy7HOlIS09Vt9jGI0KGEKNSXhPWHVfqFpoq2NFloxx80j0QVsjHOiLOCBL+A4/tGg
 3dpP9UHWwLw0YR0XR5aE9YAWw+aLRj2p1+3ec+cQKP8lPkJXL8srxSDj+SmMyGy58Op1
 5lcfxZ0PFdlKg40WzmyzHfggkcvCm3mYY2NZfXatJmrG9+ByUMcIpaSVJAdM5Rw6YNLT
 VxlMM/f1CSipHcHpEw61Ts9CFtS24f8bIGRVWHqXWjJJ12DLAv23xqbTsQ6kKZzLPbcr
 9Iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785048911; x=1785653711;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yQcSsWuGcuYv9mWdw2DlPMe/MrOO7NK+HgvDmXGBT/E=;
 b=HEP+k0msRbmWxJYcjNqJdIdd45ArIFzvibcPOvHyzfnUI5fkja15SUjK+VnQIPGOUQ
 XPszOC059uCQD+48Wb9LgtzfwBOMyYjsgiewRItzhvUpUKObzfOlyMEb7dBv/XCvm8T+
 X2Ioiyt6NGa24oMak8sWrTXA15IscYIpjJLgf6t+JpCPsHjAwf1FpMvvSpbG3IhMjc+P
 pgeVQL/R4ousyGtfNzNC7J10QBIAIi/xvdLFzFUdVi6j0puDV1y5LAsvFBqE+0C40UJw
 Zqwcsthw6uR1MT1v/ax+SqsIqbTyp/bCxrfCt/79EPe3Y9DWJB4rXRG/BdIMWuvgvq/s
 E8iA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqwm/k7//iV12abYSrFf1CvKc3FIdxO2wa7H2tUsBHuKUVzvCSGOHzGLhfuA4ARf5yxNr4herG+0SXu@nongnu.org
X-Gm-Message-State: AOJu0YwQczpkyPbwXSNRtWACmAc8zsN68Gtr76+hv1zy1MTCe+ldk1Mf
 QbEvxamdDtwx0K+w09HuoYbfrB0f9dsjpk1Ndgl6aUMsnERnLwGH92jY0/G/fsIAxxE=
X-Gm-Gg: AR+sD13X91dkA4PDhn5lb8OjwCSWMsQ+IpraRTPhH2kgK1wwjlM0TDm3kEbtOtKfGmr
 vi8hlDenvZACyDNqbbV9w5+EaRSeeF3NDRb5K+1oDGKrqb6BdKQCzlOyKj18QlWYTri8NLrW6PR
 ubQs8pZJ3U6cPmBiq1SN8mQU95ZaSjIXTHFwhcclmkXyQ9/YE1cCegsd5QWq8wVrugpw3tvh2vF
 UCHuSSJB3PkyHrEtEVE+JYgMMUE60tsoUcLKSNpQkGwtAmfOzLvpxE56IomGoqeYlKT/vwD+h1F
 wIrKoI6W9aOR9xBrP2C+/hJmq+9Yoa92QmnArxrOhjWoEhwYNZ9BDGynn5MPPTMYcVoNxEhWyTD
 Bf47H0H0UaJPd1rLxAQuKlZB2JthGF4rLIfRlMORWRjpV2SG+VjLJjuVVYK/5slA6PH3bLPYDwa
 4GJHZHZCZE34KwMM1/fGwO
X-Received: by 2002:a17:90b:1fc4:b0:38e:6a7c:abbc with SMTP id
 98e67ed59e1d1-38f29625594mr4826105a91.3.1785048911040; 
 Sat, 25 Jul 2026 23:55:11 -0700 (PDT)
Received: from DESKTOP-7HME356.localdomain ([38.34.7.236])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-314bc44cb92sm29618246eec.13.2026.07.25.23.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2026 23:55:10 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 5/7] hw/riscv: k230: add decomp gzip in K230 board
From: Junze Cao <caojunze424@gmail.com>
To: Tao Ding <dingtao0430@163.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, farosas@suse.de, lvivier@redhat.com
In-Reply-To: <20260721161335.73872-6-dingtao0430@163.com>
References: <20260721161335.73872-1-dingtao0430@163.com>
 <20260721161335.73872-6-dingtao0430@163.com>
Date: Sun, 26 Jul 2026 14:55:01 +0800
Message-Id: <178504890122.906524.1584451280442158867.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785048904; l=279;
 i=caojunze424@gmail.com; s=junze-gmail; h=from:subject:message-id;
 bh=EFA3HxIFQzwTubhuOmsFZTW7rAhGvnoGb9B0i+rXEJU=;
 b=JV9fXgLgvDRQMCZEkd2mLcf+Nnf/FwbqPmGxta8lUJbLUfJloIUoP1bZ5jHHFJOcyuWDWM6JU
 lkSk1s0T7kvCqNl69Xg85vJAkSn+JfX1Yvc07k8ck3aXELn7YsBkfQo
X-Developer-Key: i=caojunze424@gmail.com; a=ed25519;
 pk=lnFIWNw+6CoDrHFIKUJKdgrRbvgAbQGcEFiVsIigOJ8=
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=caojunze424@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, 22 Jul 2026 00:13:33 +0800, Tao Ding <dingtao0430@163.com> wrote:
> This commit replaces the unimplemented part of Decomp_gzip in K230.
> Connect to the handshake interface of GSDMA.

Reviewed-by: bbbbbq <2082291273@qq.com>

-- 
Junze Cao <caojunze424@gmail.com>


