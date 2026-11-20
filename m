Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B397606A332
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P8yuglRe
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xUQFD-0003Es-4N; Fri, 20 Nov 2026 10:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xUQFB-0003EF-Ob
 for qemu-riscv@nongnu.org; Fri, 20 Nov 2026 10:09:41 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xUQFA-0007Ob-2N
 for qemu-riscv@nongnu.org; Fri, 20 Nov 2026 10:09:41 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4bb6057b333so4158045e9.3
 for <qemu-riscv@nongnu.org>; Fri, 20 Nov 2026 07:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795187379; x=1795792179; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=eXjlIdzRAyPiGP26Ta4PQK01jIWRUA7UZbAweyQ4rE4=;
 b=P8yuglReB3wkjd1Ptb+bg0i6pK3Aa5uRpHBHHNmIMqRCUn4ywOpP4n/+BgH7pE46bJ
 +grFIz3Ux0mapIoANDUjouk5RDqpnRN7Ztd5J6+QTzlRY5nCqT6/74oXkRKlG9pVxiOv
 aaSQ0U4ig7ZrScM0unysobEo4HkPJ0goygprb98KZljbsn8+zJDi3542qEjIHa/tVVZM
 UQZ5BRxYGEgYlswoLXntDnQdGKV+forc77q17ueIh7VgqS9fjM4y3k0CinI2JenLJzsm
 lourcbJLkUS7FW4CwfRB73OJUpUNgd9MU6F5OZtzD9TIy0huwZ5n6+8dWJUE2WE6D1+f
 f1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795187379; x=1795792179;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=eXjlIdzRAyPiGP26Ta4PQK01jIWRUA7UZbAweyQ4rE4=;
 b=Yp7OQNTR+mQZ4Ha9VZuUERqU9R340bJbLZky94Dllv4XcKsrjO7yON2i5alHrTVUC/
 +lCZXPBJXFvVLHkUUBgWdpbrpIpocZD8u1VW9wSQAXqUl6vR91WIuLJ8CGIkULtgn91U
 MJTj2ypEgI4QncJh+UgmrTLyI4iXL2FhAMBxAB7CCIGiIqZlfn9GDQZhoveFiGvXsQFO
 Jb0eVTZyEMYiPLZTKr3qGA6+h5fzIj7MIrb0SsXtm2ypI0Gucw3s2TRV98+jyGL3cEmI
 BWkLMfl/MbKVj/dsnrgYR8m+OFf+5hxcKdR7O5biMP0tM2oXBnl1EtX7Wa6eDK6BBHOW
 eyig==
X-Forwarded-Encrypted: i=1;
 AL+hErFvYfRmx1/63lFk9q1/S41wXhjEkfcI9uLsnBOl4l+LiiZb/PZ8vBTTFhyp6S7LkwVrLeikbuHyHaVs@nongnu.org
X-Gm-Message-State: APuU4Z9zPD8AkmEYZmQGWI2KpmC9J2lpIkpWNfJQTMP4DZj2Gjt2xu9I
 gOdVWfsmJgWCPC1FTk/KFZ6B45frwbC4w8ZZCIrkZVopZX6jzPfxv/tlkCOUswdoNv8=
X-Gm-Gg: AYBFou390P8+ixKHSZcjcBQoAc6CmAiXbLJJTgYBJL8urASkfa8LgqKGP/f6on7CgEi
 oRPMezjpjyG1iNa89Dus3OxSB+ltwjVqgmMHm9Ii6J59k7B5OevyJs4utrBsA5fDuiGK1JPWNkx
 U0zYOVwaLJeO1Dj48iXu7dHBMpaTzSClLFsrYieNJxudVVBlV4c13ceh6FwMkktQICUhzFr6HKJ
 86ULGuw+0EGaJrEIV8YGyVdJa8p1gEEug83cLlSJMN2m09N1YTf3eXKkRcPSsEqTR8ua4k8mi0t
 w4J9iYjX6Pz/8HOKZZ1AMjwgdRQNs7GyQ0AwHGVXrSRMnAW5GbWctNnz0zGsWX+Dg5ObOI9gdxQ
 iYCN8RgyaBCTkd+ZMXzo8Ua4ZYAmOgxLc9Q2xgGYpglcNIu1hkzYvj+KHgG7MsO/0noZ8gzWuaI
 MxNCi/xZBkfT4lq1nnjbSR6F+FRo4J9Cc/kIVKUG9mOpUKUCQDWFJhm0MQuSSzck5K1wlYU4ivw
 LA9PUdOKzk9Q+SO009jFli7MI7JQGPIFf3JMa7wc6+Ju8IYz/epi0L6e9eLU0lIzj3Frgj5HNlX
 FmHbBMTPLoU/VX0Ggu4xH1D7snW44e/LKQh9tqbaNGFWroLtD8w=
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id
 5b1f17b1804b1-4bb8881c630mr83051225e9.27.1795187378555; 
 Fri, 20 Nov 2026 07:09:38 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab658e2d60sm6141798f8f.3.2026.11.20.07.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 07:09:37 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DF8A35F7FE;
 Fri, 20 Nov 2026 15:09:36 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  peter.maydell@linaro.org,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Kuan-Wei Chiu
 <visitorckw@gmail.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Alistair
 Francis <alistair.francis@wdc.com>,  Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Chao Liu <chao.liu@processmission.com>,
 Joel Stanley <joel@jms.id.au>,  Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,  Michael Ellerman
 <mpe@kernel.org>,  Portia Stephens <portias@oss.tenstorrent.com>,  Halil
 Pasic <pasic@linux.ibm.com>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Eric Farman <farman@linux.ibm.com>,  Matthew
 Rosato <mjrosato@linux.ibm.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Zhao Liu <zhao1.liu@intel.com>,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org,  qemu-s390x@nongnu.org
Subject: Re: [PATCH v2] tests/functional: use immutable tuxboot kernel URLs
In-Reply-To: <20261112133320.418012-2-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Thu, 12 Nov 2026 17:33:20 +0400")
References: <20261112133320.418012-2-marcandre.lureau@redhat.com>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Fri, 20 Nov 2026 15:09:36 +0000
Message-ID: <877bi75ykv.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> tuxboot rebuilds the 6.18.54 kernel images in place, so the URLs
> without a datestamp now serve content that does not match the recorded
> hashes and the tuxrun tests fail to fetch their assets. Point the
> x86_64, arm64 and s390 tests at the immutable 20260930 snapshots and
> keep the hashes that were recorded against them, instead of implicitly
> switching to the rebuilt images.
>
> Do the same for the riscv64 6.11.9 kernel assets, which still used
> non-datestamped URLs; their recorded hashes already match the 20241122
> snapshot.
>
> Fixes: 8ac1aab21fca ("tests/functional: update arm64 tuxrun images")
> Fixes: 09961fafc5a0 ("tests/functional: update s390x tuxrun images")
> Fixes: 467c9eb7dd31 ("tests/functional: update x86_64 tuxrun images")
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

