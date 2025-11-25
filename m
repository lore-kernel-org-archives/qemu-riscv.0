Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70CACFD36C
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 06:25:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vNmTl-0004UD-Ny; Tue, 25 Nov 2025 01:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNmTX-0004RN-6W
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 01:24:33 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNmTT-0003TJ-N1
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 01:24:29 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso38434065e9.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Nov 2025 22:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764051865; x=1764656665; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vq1z7uETBPWyiFMQkSi+G7SH23QCq9t1LMUTYPMDnpc=;
 b=UY25TzbACojPkGnY6vTt4W1y22wz4Jsh3sx0XTC9k0gy2yK8B2n4efDZjByG8wwazW
 567LCm0Yzmioc8Z/Ed1OhmkrKZL2wV00yCI1vlvyz+Ijrlk/qNo8Pxxgc4U+rtULflFI
 1y+TwykxNTiBgxymbiohTrISdbPsZEdnWshpi0nU+yZ91uKPLNs8gcFOuaIW69ISNCV/
 RLFtedqauSrIc2FzjOJMxIv8hzGRsohzTH7WFQKOfDbE+hFKbX1GRYDUOxw6MC+iGgjA
 9+0R4boJvODyMGUwGwawJmhUJNr00+5eJK9pY36hURk1sx1VWlAuwZ+2wjaqDyXjhDMa
 hhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764051865; x=1764656665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vq1z7uETBPWyiFMQkSi+G7SH23QCq9t1LMUTYPMDnpc=;
 b=e19b5aaUjqS4PHV+qFkGYiDuVTBof5jO++lkxEWtJ59eWFCCQiaq8RQYihZLLlT/3k
 vNLYF4MgyPgcXKuboO2XpSEtOfA/IUtqLbpm1sqpG41gIceNAKt3RD4bpPkp3BJdxJLM
 vtWLtQi6DtTVXqpaB09l09qq07m8herr2oOVATopqVQo+mZhlMXArc8J2+rfh3Xrj4yi
 iY6fcobMd9iDUHer+YBFzgK9Mtu0KUuxrNOb9rOV74tRCUWta4HUV5THuowGilWB4N6e
 FfdqCBZyZ6Rs9X0N/LL9CUmDdxFy8NjH+4xr3Na0RSl6uuuFdC5y2xYito4mXi5wFHHE
 ojnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpVRODejqQN3vlakQVBcMtnuVyJOdxSEz5ITxtEHc8NQ88zjKvkj1vhnlAsFdDrOPUnLmtJLoyjam+@nongnu.org
X-Gm-Message-State: AOJu0YxkStTrZ7QhQZ2O4o+dM4wrqDr7NnVQ53LZH0uV6STCveqnYOlT
 sMAgGin9OTCK6Lx2D7itXk7KEvNHsjFtxNTk6wLHIoaBRw6m19VjcKLBFKZuGqXWhqw=
X-Gm-Gg: ASbGncsa/i4XRSbZRAalbOTNDg8w9oY/i1LJJkWHSVNrsUQ0Q6k4VrICEZLUf4Ofd6J
 Vbxpy1rC4D9aUFQ97/9/7lX2+E1nBFpFR2IfaCaB5G8nZG752NE/rnsIRoAorpM1N/LZ+YnhEQW
 ymRrPlXpwegji1W9muLAFOtYejuI9D0l6XYflmyHn9tRWimAVwD7OR0wkc+UXajpb+Rq0vr3NxB
 banTK/ewqRnP/Ox4u+cuUHysQ9P1WdzgHYcBCrbQu30CEnOSuG9Nlm0xrNNaqAmw2VLdnkhhuK8
 6tGFMYVtBVE/RQma+eq54lKTjVBfuTTe7XajgDLMwCkm28rHirl6457MQ1dUSjqiUCf4fGCHtjl
 2sc/b4kDq5m1USFdRxbJrcYEUO0J64wXpUM6q8OzYXZNW1G9jo/mQi8FrztDN4X0ESGFLRrpbTl
 a4/B4LfcesiQ9v8lxSo8AF1LVwWxbtVpfcb74xs4POgY+j13PGtGXB3Ks4ZMMrLjpD
X-Google-Smtp-Source: AGHT+IEaf9VPAlvbB+DJWu+zfTWBlEbYA/AGQ5BPVvtwmDg4JvdCIECBmvF4Zcsn6awffVSNfsJ6Hw==
X-Received: by 2002:a05:6000:228a:b0:429:cc39:99c0 with SMTP id
 ffacd0b85a97d-42cc12f1bddmr17201116f8f.1.1764051865045; 
 Mon, 24 Nov 2025 22:24:25 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fd8d97sm31796036f8f.42.2025.11.24.22.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:24:24 -0800 (PST)
Message-ID: <f356b3c8-ed08-4ec9-93c8-dc9dc6accc59@linaro.org>
Date: Tue, 25 Nov 2025 07:24:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] qga/commands-win32: Use error_setg_win32() for
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
 <20251121121438.1249498-15-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-15-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 21/11/25 13:14, Markus Armbruster wrote:
> We include numeric GetLastError() codes in error messages in a few
> places, like this:
> 
>      error_setg(errp, "GRIPE: %d", (int)GetLastError());
> 
> Show text instead, like this:
> 
>      error_setg_win32(errp, GetLastError(), "GRIPE");
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   qga/commands-win32.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


