Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83DBCFD315
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 06:25:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vNmUJ-00051J-QA; Tue, 25 Nov 2025 01:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNmUE-0004qw-Et
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 01:25:14 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNmUA-0003nj-D1
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 01:25:14 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so56101705e9.3
 for <qemu-riscv@nongnu.org>; Mon, 24 Nov 2025 22:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764051909; x=1764656709; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kq1R/KnIl0tjtGNpVBFK4blvRpvREmYvjs4Wzx+ZU8A=;
 b=r7Fjv1x1QIUZ27TC+N6rW86RME/T4eVzmDQICnymq/Nc7OfzM1yfSQaajjPsd597dS
 YLmm+aRBkl5iU/7MWcKUAFwwNpHUhLizv2t6WqqowSyBLHrpr55CtciZhHMUwIyL/HZM
 7nvitYK8wn0HVSB6D9TpRyGsfChO7/lND2E/Q0mMoZFKXY8w+HoVeKt2V5zMt1i+oIt3
 CEDZn3PJmIf1T3rI42KagWL9d/1G36ifD0QZXzA5WP/N1Zbepd/eS+hgnJLgEu4U3RQv
 qe9I/pQZB8NlcdBbpkwCzd0WvXTj/XKTBuoDd03uIlpnWA6qEEEK7xQgL+oWLq9lWui9
 7kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764051909; x=1764656709;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kq1R/KnIl0tjtGNpVBFK4blvRpvREmYvjs4Wzx+ZU8A=;
 b=Tu30Rj9iPpu2yOdt6qKuhWoh4cB3Hnc0q/eWK74UczbHuqwZilZURmVlXsg0qeuJRS
 AGlUlj8kS9/Yl6jqAAuOGNLWjFM1HRvB2UXkP7DMVVAVBN6nruqkpnT8WR9aKq4TAN2d
 9WZ6phc1FlOWmG3WpJe6b4HylZgxEwwhK6TNl0KDvcIhtfn7o3SVTUcwxm+Iam0epC/F
 o2ChHhKKb0bVPV66UQAl1tb8OM9N0K6SKVG7Tj6iEBFcQ/7gs1a2koA15FAFJpw9aZEX
 7mQc9XTqToriIYRdw076KNugnD31kPTVoVEECfMF0JMZKNA0bOQV42zf3K8/1pq4ud+G
 qOMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuLd4UaJQBz9agMFfHeAruEA+7+89W+mC9A5FU2M+Kh2t6Hig5mYKNPW3D1O4KawOoZ27/5L9AuG1g@nongnu.org
X-Gm-Message-State: AOJu0YxuM1lMGdCnBfQQ3AZ6ASQ/RDNHMwSzIDnTS8tRQy+eJD+7VzRT
 rejrKmlXZfV423m0SGix4Md5pYa8PrkK1UiWPOok6EceBrd+iDjO92DgV4a9MjGZ8Bg=
X-Gm-Gg: ASbGncs3aB4pwwbkcxzOEpze59OjmA+hQvOXVWurwifpAvZve9TexJ68GWQWgIh2grK
 IOYnRRQNv9s3xu6GNA93ClindeRFI2gXvIKRBp5Xcl3n+HKQGFKaKdnnPankSZpk6JN0SbSNoKy
 1EdXA5elCBi5ig8lwI6gj6ccyY5SPG0+UHfmxc9em4ORjw7Zpv7MyjtGQa/jHwxBqtUsvT0/u/9
 WUBYUGUD2SfeR1dxXC5J+Tjpe0iuqbwDxzKJkJIlgIrQAtN0pHRlnZsmRIoyIqR2gSm6tjmMte0
 hTngfLPpHH4SWI830BOG/l5daNSLsaXZBVDuxVJzYSP6fIBD/7rcFE1pl0YsbkZJ30FVozHUiea
 chNGguzLukHUvd/WnQq7Gt9rjeYdAoejL6UtjeWsofWycFOOZYJfYSFScHpG5lqNGLxVJA7f82y
 2E1I4CZin1aO5byiDeq5kacFgroKL5XnHdliQSz1uW07HIWvWaZv/vwQ==
X-Google-Smtp-Source: AGHT+IFprm3vCDsbWVJfgbV9xKa8iHTCEmXL664XoxSCOsyM7eQ2uIrryW9dfBTvUiv91/I4gz9/gg==
X-Received: by 2002:a05:600c:4685:b0:477:5b0a:e616 with SMTP id
 5b1f17b1804b1-47904acaf28mr11379725e9.5.1764051908756; 
 Mon, 24 Nov 2025 22:25:08 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f34ff3sm32968445f8f.16.2025.11.24.22.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:25:08 -0800 (PST)
Message-ID: <54be619f-1de6-47c6-993c-246fa6252596@linaro.org>
Date: Tue, 25 Nov 2025 07:25:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] block/file-win32: Improve an error message
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, zhenwei.pi@linux.dev, alistair.francis@wdc.com,
 stefanb@linux.vnet.ibm.com, kwolf@redhat.com, hreitz@redhat.com,
 sw@weilnetz.de, qemu_oss@crudebyte.com, groug@kaod.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, kraxel@redhat.com,
 shentey@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com, jag.raman@oracle.com,
 sgarzare@redhat.com, pbonzini@redhat.com, fam@euphon.net, alex@shazbot.org,
 clg@redhat.com, peterx@redhat.com, farosas@suse.de, lizhijian@fujitsu.com,
 dave@treblig.org, jasowang@redhat.com, samuel.thibault@ens-lyon.org,
 michael.roth@amd.com, kkostiuk@redhat.com, zhao1.liu@intel.com,
 mtosatti@redhat.com, rathc@linux.ibm.com, palmer@dabbelt.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, marcandre.lureau@redhat.com,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20251121121438.1249498-1-armbru@redhat.com>
 <20251121121438.1249498-16-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-16-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 21/11/25 13:14, Markus Armbruster wrote:
> Two out of three calls of CreateFile() use error_setg_win32() to
> report errors.  The third uses error_setg_errno(), mapping
> ERROR_ACCESS_DENIED to EACCES, and everything else to EINVAL, throwing
> away detail.  Switch it to error_setg_win32().
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   block/file-win32.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


