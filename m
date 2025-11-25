Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62206CFD377
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 10:29:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vNqI0-00032u-3o; Tue, 25 Nov 2025 05:28:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqHq-0002wm-JD
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:28:46 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqHo-0005k4-A8
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:28:42 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-640ca678745so8958388a12.2
 for <qemu-riscv@nongnu.org>; Tue, 25 Nov 2025 02:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764066518; x=1764671318; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s1upGUE7YIUICVmJUED5d5whRme8CL9poQ2KbESMmuo=;
 b=q/Ax3b+/4qIhuEOW9sU2poEUkZPSqC5dNcX1mzxP66hNNPaxHNbJa4Dz3b+0HbR+cx
 9/98QdTFHmUyqvL4PhXVMNGlngvNxxl7bizt/2rFFQGjEEjuyjFVyBy+cw5Uz912j7Hg
 5TE0llJve0lvTjhBKbqv3oRrIpEPtNRC6OoSwXJdG+5oGMmycsVqqYplLaFXswqw5FSL
 7lE21j5Cp1iJyIsgV+yuH9XHjYpEbawWO7HIB4zZnUKS6Yp6S02/vy8xgIQvjyiZeY+3
 XCg01sqdk/eMx52ykCHTgGgGexHJtbGNOYqXC7k/CSdksK0CLSepPafnPqMlaFXnmnzz
 p+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764066518; x=1764671318;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s1upGUE7YIUICVmJUED5d5whRme8CL9poQ2KbESMmuo=;
 b=hXIrsoIapQy+PgcIWUx+fdRjd4FaJ3qwBtjBAY8vW+BlO21oxcjCPRJMete7fEbeKP
 30Lmmi+C8OTwmweyGxMUxLNP31Hsd4P6xR5EwuUVD0OqTjVmQcybbqp0tkLKmc+9Ez31
 FeUBCs1+IJ3s4DXBOv1SkHpoUn6LHNx17+Hd4Em5hobS51qz3F86PilO4lOiP4xu+aVa
 KGlSoiqmQxVQb4aB1Ofg8KwypZqdjSP/fifuDayXBJ1b9qIDDLRMombqOl7OsMkp3qE1
 nWTgr37krHqh8c2FRCXSPhTDdahydDaHl1TGzlDd38SL1bUSHzEWQ7Th/4F/vVBTO7qN
 kzJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURb6xTxMjgFxvCheuM1C2URLGJb9n1LrxHKU5S6TS1j+uxmolYR2bSErNnRIGqTdsGqQVSRqFqqrdy@nongnu.org
X-Gm-Message-State: AOJu0Yz1HPOPojqADorAi3OH8rqU8OdcZsTujLWhFwS3yuau1hkv91Sb
 AT+RNzZ/jXPyZbPXYJfUtiCZYI+J/WHsRQoCZbBuI+HCZHf+lp8rcDxZ1C7hatuudC4=
X-Gm-Gg: ASbGncvqK5KkYcB3oApjpKyPIb4cI3axMy7xWeO4GHmGPKsEsZNbM/+zMfHT+Crr8Ay
 x62Pn7pghdW347wKtnWyzkF0iJYyqlVdJHaaUiFJTGd41uSDCCUUCfqGO7Fx68/fevzqhUOySir
 1bTwMzkhR1vlJIHvG2N8Vn/266/1pFds6nZ7pwx/YZrGl54UXyiz6PfVtpWyffeHiZ7GKAwe202
 2AmbiqYzpS7CxdsJVlVyTVUrDyqjwQIpzJ33mHhmBB4Lbd/0PPqXD35IbwVb24MfseohMdgMyn2
 fCVCqn5XFeSIBvWx0qzVtXzOkyYNrppku04W8GzHCFsv3vBExekk4aM1upOo+kgO+G0wOof11wQ
 g3qwHFQarxHN+1i6ZVNsV82Wa0fICmsLYA4CG/38eyGNRRdHNR0EEa9/m8jMeIwHqEPaMZd7MkJ
 j1bxXodIMbqhUzynCV6vy9OYMrNYU2MTDIXOVTt/DjbGkkaVzPDpZ/1A==
X-Google-Smtp-Source: AGHT+IF59L37GgnGAgNCiHvqRTLRI2aTvHyr6yOsdF3ewgBPJ+5ZCFL6F0XLm22Mv4gcL1oVkiKNmQ==
X-Received: by 2002:a17:906:fe0a:b0:b73:8bd4:8fb with SMTP id
 a640c23a62f3a-b76717322d4mr1729884566b.42.1764066517609; 
 Tue, 25 Nov 2025 02:28:37 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654d3bfcesm1536852566b.15.2025.11.25.02.28.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 02:28:37 -0800 (PST)
Message-ID: <b9cd0110-4a91-4ef5-a139-2dcd45b2a0cc@linaro.org>
Date: Tue, 25 Nov 2025 11:28:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] blkdebug: Use error_setg_file_open() for a
 better error message
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
 <20251121121438.1249498-10-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-10-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
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
> The error message changes from
> 
>      Could not read blkdebug config file: REASON
> 
> to
> 
>      Could not open 'FNAME': REASON
> 
> I think the exact file name is more useful to know than the file's
> purpose.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   block/blkdebug.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


