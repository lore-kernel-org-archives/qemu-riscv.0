Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2C7CFD315
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 06:17:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vNmMZ-0005U4-M4; Tue, 25 Nov 2025 01:17:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNmML-0005Ow-Ix
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 01:17:07 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNmMI-00029q-Gm
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 01:17:04 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so53517595e9.2
 for <qemu-riscv@nongnu.org>; Mon, 24 Nov 2025 22:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764051421; x=1764656221; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PPPfFfN/KUZJSdg4GVyykKSiNQuZspsjOUrb6Yk6o8M=;
 b=kGOCEXHM3TYp0E6HTc0cK+Vpl+V7iFmBK6G6a7ctfvkjkgJkr72PV+bTAJlNgm9UOq
 TSd7QaVN6Sd58LmaDK14CHsGeVsbYkmnMnYlhafB6T87OonvMQCRxHHgNhOT516aX8si
 EghmP8kp7/oRD2HEkkRpxAM/fIZL8u+SH/mG9CB1BAaXMA6XwiOHvdKSmUrtWrJJuEU+
 9CiDrHR/Mj3hfQKxSYV43Nd+9yUOD1oE09AvhV9jyG2Aja/45RgyT1OkJUXenwUzLtf8
 QiXA7ffcT4YmOmJkj3cAqNwwV9IwdMtYYtx3agRGreJVcj5hkXPGqQjzcWvpk7esIoib
 7cMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764051421; x=1764656221;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PPPfFfN/KUZJSdg4GVyykKSiNQuZspsjOUrb6Yk6o8M=;
 b=cB/9Q/0s0vZBxu7TnJtlvODvmwXEJx/yihXnM1r6PACk0IYIAloJfYlqvrjDxjwuE2
 Q5stRtT2ZeLFw43uS5BDyQsI/edhutcaL3llGQX+RHt3U0z5fcjirB1pqPwsz/a/ACSs
 P+QUc9+y0XBH9G5tf5Zq/NcuCxIKZTwlj0UAmWbM5LkAzAMTr2ryCV+lu4iSKrBGxeIQ
 g90AY/jGLG4iU23/+phUZo7KWRZ5cmKjJR64X2va+zhlkz6m/jDfIwJk3sfxhTGO0Rml
 J7CjoPOnpcAJ0etIRUh9igNgQASU+eMXgYoZvpN8UhCwH9n4tbY0nDfB6BjeriP6o42O
 jYYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX9yf1N5skrXNy9I/habA5xUklVWyJLEnZKVZFIX3J0IIKuQix/Ka8ljvnntorddaXeKxH2aUtNyl8@nongnu.org
X-Gm-Message-State: AOJu0Yw+v6VV8IgClVcFkLcCNdDTS5/Yn22f3Qb9mFg1ZH5hFufl/mff
 8saCi6Q+E97grrqKXCqTWOGslCKg9mdKhOXynekA2kwEwWyIYY+CsnEPxTwra/Xf6go=
X-Gm-Gg: ASbGncsDAPpMgaRTwH/N6xA2GAoAUVFb1GdnZ6I0mWeEvWdEsA/K1yfpgE1tfJyTZVN
 eErM105Or6rtsp6mXOHptchHOUVF2HBOKfUxaVdEVAH94sA8WWlQM8Huip7PN2araTQF4U/3UEM
 +jXpsOG28ygOXRgnnPZRb2RAXr6kj8ROW/OSorULivi8UgrGvvAOzDFjDW+6TMQ0NBUFHvyqwod
 TVMbXJio2hP87cTi6+eKljCHmEBGzEhEjhLa47oXOgZamNP1WhHgSS0SI7NcutwO7JN3UkQWUd3
 GtrjdgwbbshWeOijzIOWHM7m1UGCJFrSq6sAzJCzleqCLchsGfFqg8zDjEHJW7ffYbviSISOuhU
 idIbUrhUJqeNrzyWOmB1GSIcqP5rZaigTiApE8Ns4OjbAtgrpMPY+1cxr8onT52/kO/fuZuvAx0
 rGXfmq7BPt+osQll3LXzj9qMktGDrXPaFnUPpsa+fQKGdJNscuH/mqgg==
X-Google-Smtp-Source: AGHT+IEZ8yeE/n/51O0eDQmUGk/RzXgmUxX0n0wP7TPhPNjZtJBLXLV0NRiL/n6XCwlWTPrAzRjq6A==
X-Received: by 2002:a05:600c:8b37:b0:477:76bf:e1fb with SMTP id
 5b1f17b1804b1-47904b1ab30mr12560125e9.16.1764051420782; 
 Mon, 24 Nov 2025 22:17:00 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf3aef57sm221641805e9.11.2025.11.24.22.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:17:00 -0800 (PST)
Message-ID: <fed0991f-0ad8-4da4-a182-1bd0c7ec6b9f@linaro.org>
Date: Tue, 25 Nov 2025 07:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/15] tap-solaris: Use error_setg_file_open() for
 better error messages
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
 <20251121121438.1249498-5-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-5-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
> Error messages change from
> 
>      Can't open /dev/ip (actually /dev/udp)
>      Can't open /dev/tap
>      Can't open /dev/tap (2)
> 
> to
> 
>      Could not open '/dev/udp': REASON
>      Could not open '/dev/tap': REASON
> 
> where REASON is the value of strerror(errno).
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dave@treblig.org>
> ---
>   net/tap-solaris.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


