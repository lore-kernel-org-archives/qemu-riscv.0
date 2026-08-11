Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4B7C5AC67
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 09:17:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtibA-00016G-9d; Tue, 11 Aug 2026 05:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wtib8-00015g-7F
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2026 05:16:38 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wtib6-0004SB-JL
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2026 05:16:37 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-38ecc48b3deso513567a91.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 02:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786439795; x=1787044595; darn=nongnu.org;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ZfnsgyLH4PQ/qK2TwhvO60jxZORJRM1+PUVK8kwg46U=;
 b=pSA9ewKvEkiTvHaxGpvMIPbZMEmT/HNOm9gWX2LUc7h/41jMzxaTKnVQBb6RLsThqJ
 AQ3oyEQJ3UdCFB7qZ5plrPRvEeLGs6gYiESLV3lCiZQF5kU0CV6B/kiknDTTrxq2HDFc
 J+/Qg6gVKzUzh7oPKJGgNNWArVLNCkP8Ihg/pgHEceLfLZi3EdioLPtsSDpHdtCt22HS
 AEaBOG+HOf/dNIFRl+XUBBJBQVGqxeuFZPCZQ5XhZnwPQPE1s8xHW+ieRiXTXK1V5rCF
 9YakrVeSGHUKdmDWXqV9wWojj2ZSAZdVNQdUdrUuzeyWSW9hjwgb+qPAl6RIII16elDW
 qpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786439795; x=1787044595;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZfnsgyLH4PQ/qK2TwhvO60jxZORJRM1+PUVK8kwg46U=;
 b=c2qimNrAllyge2UPXfdf+uBPOHgkVoie5ynoHm6rQNVMEAgGg9hWxO5cw295Jf91z9
 4UKxnLYWBIMycFPKeVg5nYo1I6HWrbyxoSGclWdcGfIjRpSl87BAGdyNh9joMHRfeVxX
 aCp56vuAOr9nDzh+ShQpVgr5DLe1ydNENZmWt1NkI0INntcZONFb3bTTmUIlUmfM5fZ5
 LRiAFD8aOVMMJr56g/rrT/eaUjHTwFyOtYnyxV00HhTtwb4OfY4mhKKReQD3W1nnl3fs
 uUIt9WhrfOAZ3zp5+mSn2o5PyHxXrxNklLS+y8f+65SePmF4iWk7OCxg6bVvbAv+EM6r
 Ze1g==
X-Forwarded-Encrypted: i=1;
 AHgh+Rodlo2LpdDA9K2Q9yf2qgIvnxeDB1DKUqtQRHH6TLqPqeEAm5yNNC4aJnzumGwhUZ4L4IZ8gMMQxRAc@nongnu.org
X-Gm-Message-State: AOJu0YxZBA2pwk8BC+Iw/zRMwk23Y9K8NotuP7uVTLAk3hKnOHL5lfVT
 uzCyjq/o9l7Ra+KqzZvM0cOE/3HscC/3XpqOeGXl6Gm3C6H/idEuCCeU
X-Gm-Gg: AR+sD10PwbXUpfHfr/6yCLzHDSMQn7BizMGlm+fyvmYJbAX39ejByl2F9t+U2TpAbTu
 70AJ32h5BsxX9ag8yiVY9f7X8n+gEpRp+INYrBu5Ns4+LD2x+bjgzEf5a717laPcTBOkaaGuAIH
 SZb+hAhCoWptWpOzbmkssOrjUT1nt+p5hCIfZmvPLygcb++YyqZrdrP4t/jejn7bXGbDMoFoxa4
 MsP9rlkLgLuT8SIhhyfwwUYaM5GtP7Wy37cFcpNbmA1c1i3dBRcziOQAtwnPiCGlC+MeM+3pxS3
 6Iyjlnt8KP6w7VivnpU/tkOwthsoZ/NCFMd+JvExa7c4mYnEUzKvKpQrFe6NPTzEjNlABBQavv5
 Uzb4q8VO6t2TMJYLUMFo0hc2/wBzQzbaQZO2EXcMTaijkkU2YcIDGJDEi7E/DzZlVoiCXcatWSU
 M47xH+F3S1PwbyWeE5no9toXabJZIif/J4pm5E1FlcNS5K+amprracIN8dzSXXHFy+u9vQ0uHee
 bGGwU6p
X-Received: by 2002:a17:90a:ec87:b0:381:2788:a437 with SMTP id
 98e67ed59e1d1-392ec4d2710mr1343223a91.1.1786439794667; 
 Tue, 11 Aug 2026 02:16:34 -0700 (PDT)
Received: from [127.0.0.1] ([38.34.7.236]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1412042d1dfsm3214257c88.9.2026.08.11.02.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 02:16:33 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 0/7] K230: add gsdma and decomp_gzip
From: Junze Cao <caojunze424@gmail.com>
To: Tao Ding <dingtao0430@163.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, farosas@suse.de, lvivier@redhat.com, 
 pierrick.bouvier@oss.qualcomm.com, caojunze424@gmail.com
In-Reply-To: <20260808062227.66961-1-dingtao0430@163.com>
References: <20260808062227.66961-1-dingtao0430@163.com>
Date: Tue, 11 Aug 2026 17:16:25 +0800
Message-Id: <178643978570.1229420.7326743782506484256.b4-review@b4>
X-Mailer: b4 0.15.2
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=caojunze424@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Sat, 08 Aug 2026 14:22:20 +0800, Tao Ding <dingtao0430@163.com> wrote:
> [...]
>  create mode 100644 tests/qtest/k230-decomp-gzip-test.c
>  create mode 100644 tests/qtest/k230-gsdma-test.c
> 
> base-commit: 300438ffbb8d9430cac2fcc15cba6f482b2c0587
> --
> 2.43.0

Thank you very much for your contribution.

I think there's nothing wrong with the code.

Reviewed-by: Junze Cao <caojunze424@gmail.com>

-- 
Junze Cao <caojunze424@gmail.com>

