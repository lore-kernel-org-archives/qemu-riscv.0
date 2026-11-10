Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C10606ED45
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=mYpV2YjF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQlSX-0007OI-MI; Tue, 10 Nov 2026 08:00:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xQlSH-0007Kn-Rf
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 08:00:07 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xQlSF-00016s-RW
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 08:00:05 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-8a4c72951b8so1197193b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 05:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1794315601; x=1794920401; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZMo+X1qc56rPSUbOWYWYhVkTSNuI8Bf5OhC55lmr9yg=;
 b=mYpV2YjF//dR6swTHF7BUxF0WZqEk98d3QsZXTJuCvG+DJ9g8bzGqDZL5sfXFvmj1x
 bfNu0ZLscx4UFpNeAoBiCQd3yZ5Jm9v2rSpiXUlgSRMwvzyHeCMyKXv9RMVpNGlXGKav
 CFBGnGG3w2RC9EqnULazfeI5ezaE3ZMJ1xpro2Aj0cBhEz85HLJNeOl7wvki8onTISsq
 iakL3fj0GsGkWaPah0e5iSqrVobfJIkTNvan5NDuvZDW03gHZBgqif8pdMgCsQqEMstW
 V7Oz6ZTaxrS5nkFC1z8b80IHJnfZ+2MjLOyhhWjSkAUq9rH9Bim8akudO/723NsuMhM8
 HoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794315601; x=1794920401;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZMo+X1qc56rPSUbOWYWYhVkTSNuI8Bf5OhC55lmr9yg=;
 b=bfYh/72dKfeTGXQrj37S/PxVrrKp3Zbad/dsD8fhW4o6G0W1ZcVe1z/XaO9n8YfIBH
 1ORy6TCz/TbH/p2WQceXJaLMQHrwQsKXPN72CJU2b1ujxnDC+YLgMM5iSE6jkPjuB6//
 zH7vl6W98HArB4XQuW/dIo55VfTxaxLnYmWK1iHKexugqyJiKmS6i53KyyiE2QKzr2RS
 TbTPGNPH4SIswkKZu6lHLiOsK6zayzrxKL+YHC8cdJtPA9vLlqoUpDgQZEcSNhXi3dmp
 6PWmTmjNHhA5+ib6TPgXFuURiIWjCuixKgt3HYIhu5BtvJXoKyuk077Agb/XUnKYh5s2
 XGCw==
X-Forwarded-Encrypted: i=1;
 AL+hErErazfm6tyEQdgAmqsb4uQssYZv4EhJHtX3vU4wWJbGGBxo3fCXqvQUpcTzeRs7iTAs34WzaNzhm2RN@nongnu.org
X-Gm-Message-State: APuU4Z9eTuOzS6MvfZD1YhNYTHGAF4kVZ5HnmtNGHT5hC7ss4ZzosVGH
 8/fAr2hfwSY9WTU45onDXq4v2q5AEgSNuRaUmEirHCm9s+tHNEYuHqxsh/56hBIHA1w=
X-Gm-Gg: AYBFou3Wztjm0eMc7Kq2ejoAodm6FVFWPoY9BXHLdUghVtmTF6798Js3cY+KwICiCZR
 qim0zYnS15wQSsqkaUa+045zOEynvhpFVcw5V4ihTfQXEZdl1CavTfuMUCwJKLAHTjQS6cH+IBr
 9qbj/u418q9u92UHJuQ/vMgzUUAlIqVa9lps+Vp5dm1WTYjwFJcm+Bqn287t/39+UnAMrzd7Ygq
 8dkIb0s/mciFKtCn/nsljK8NuFnm0TOXchXQsLzgwggVhyau0UEbjAkPux1/++rNH5lozfAVaIz
 7zZZp6H+TdqwKNX6De3Z8fmkPgZXFgossNmud7DfFZgrGjXybMxIhGdMcS8pyjiDkw9E3l1/847
 4/4pJmxWxQjgQp3nd0Zn4fTNei/UTw/D5zkRFaIo94pvQbB15qRKRxQ6BfVeAZhiypcdsXJo1Iq
 Kb8WPpT9/x0gsbaTngAGwKxoozSJbtnhSqDCxYgWbc4IOrMEt9UuqgUqq04iULhdyhh3kn7BxvG
 gJfSrMILfERw82wNpMSjvHUbQofWug37JeTuroLhXYswjx8RyRsR8rgPnoMKMZZEkDQdy4WyLiQ
 6hdqVEcuossXRoZYfSjT9xD+Ozf5YQDoCSKJKE4LqIVUBhiTVHQKJmoS776aSjWob0y8TKZ9Jw=
 =
X-Received: by 2002:a05:6a20:4307:b0:3e2:3737:75fd with SMTP id
 adf61e73a8af0-3f19018a89fmr2515218637.58.1794315601279; 
 Tue, 10 Nov 2026 05:00:01 -0800 (PST)
Received: from sifive.com ([167.103.28.185]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cdd8d7a5680sm731266a12.21.2026.11.10.04.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 05:00:00 -0800 (PST)
Date: Tue, 10 Nov 2026 21:59:56 +0900
From: Max Chou <max.chou@sifive.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: Re: [RFC PATCH 13/38] target/riscv: rvv: Implement Zvfwdota16bf
 instruction
Message-ID: <avMUr0mgv2Z4I2u7@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
 <20261104194155.679241-14-max.chou@sifive.com>
 <ac3eb49a-72bd-47de-8386-0c6cc2aa8382@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac3eb49a-72bd-47de-8386-0c6cc2aa8382@oss.qualcomm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-09 17:15, Daniel Henrique Barboza wrote:
> On 11/4/2026 4:41 PM, Max Chou wrote:
> > ---
> > +    bfloat16 *a_vec, *b_vec;
> 
> Although we don't have any existing instances of it in the code, it is perfectly
> fine to do:
> 
> +    g_autofree bfloat16 *a_vec = NULL;
> +    g_autofree bfloat16 *b_vec = NULL;
> 
> 
> Sparing us from calling g_free() on both arrays later.
> 
> 
> LGTM otherwise.  Thanks,
> Daniel
> 

Hi Daniel,

Thanks for the suggestion. Will provide v2 for this.

rnax

