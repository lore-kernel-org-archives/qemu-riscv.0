Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C73CCF9E3
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 13:02:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vIRWi-0004rR-Fv; Mon, 10 Nov 2025 08:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vIR0r-0006pF-CI
 for qemu-riscv@nongnu.org; Mon, 10 Nov 2025 07:28:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vIR0p-0001ro-3I
 for qemu-riscv@nongnu.org; Mon, 10 Nov 2025 07:28:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762777725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UHCIcnmCFYluOts0s83RaynDq0U5VxapwBYKJ3qbFlY=;
 b=R99diqjNDBhNQRLJDqy/Mm1kaaH9FLwzxrdjXbzMg5L06KrMxtm2q4Vn6r9mB351/cd7RF
 RkZsoqHecnt4TF3XFXw053Sek4eR0bCF0Egxgg2llQFLCEfBTU+sJ6Gw7iZFv6AY4rWGow
 EEwz8+5v9UJPA5i4oxn7dXiR6Utb8Rc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-u46UuPaBNkmhzTo6NfWH3g-1; Mon, 10 Nov 2025 07:28:44 -0500
X-MC-Unique: u46UuPaBNkmhzTo6NfWH3g-1
X-Mimecast-MFC-AGG-ID: u46UuPaBNkmhzTo6NfWH3g_1762777723
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4777a022d1fso8752455e9.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Nov 2025 04:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762777723; x=1763382523;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UHCIcnmCFYluOts0s83RaynDq0U5VxapwBYKJ3qbFlY=;
 b=e1u5nsVDwVGj/xkM99oyWiA0JrUwY/KeZmEP8AVHvBitaRebHdBtZNOVAoIb7Yyf7n
 FCL1R96NRbDEbITJWiyij5pvIOOhxmJJqwy8NcrkrtfLQm9AczxlPhx25cjKIlNTX6DT
 1seYFtLzcIjL/UGYGhvSRTGAhYhGsq6Il9GXcNDlDin6gTCUYxyAdoxzt1GcRkS4cfAJ
 SnudjaV8amEirdzy3qjLOZFy1J9zbv57wkliFVTMAV2G06Czcs2vxwJ6gO+V26mqMJpt
 RZUZMgFEyHlmKIhcxpYkDlY+HY1a9B4+84g3nH3z98WWYLJ0nguBpJkys8H4fRo3PqTR
 Pdeg==
X-Gm-Message-State: AOJu0YwZA5dKdu5ErioGkOO91B3PuTB3nbmKpiaZcUtAoKY9fZp6dnLB
 TMsgtAczE2gQJWsiKst1Rd3XMs5SFXdOYJIICmBArw6mGBJQsSI93AII0b8zSdhdUQLSYcktKBB
 n1dqMiIUnMq2usmP/Ux2tBpMRPZIgwyfQ2WhKXY5VyPyjWKV6o+wmviJk
X-Gm-Gg: ASbGnctF3h2ecaKpQU3LQ5GnNcqKopGeaLq3fzv3UfBzanCGdg5+Fhce/Pn5n5FnlQq
 XURDqz+fDR74hTNFoPe1g3WWhh0G0ly8TFaKDOzKwvb/OqMboRAMoQNr0e1E5vdhjG9wPdLLF4C
 uEe8YJ0Of/WsV/IEUYwThemPki2/9QpX3lcjXCZ5EnSSIeTLjDwxoN33MQ7fmT4K16VXArTtMB7
 QzclWvsXAqA0/mBlb0oTMov1Kj5R/FIEozrYiVwDtm0Clz2xy8UWPRKG71A5X5Q85d1aYjCqEzT
 kHbtbYf91aj0iZjZVuC9FIkAWU5KL4gKAjh2eQ7yZkSfRAnraO8sxj5XgabY6rR0Xgha5peU
X-Received: by 2002:a05:600c:474c:b0:475:da13:256b with SMTP id
 5b1f17b1804b1-4777329777amr70078985e9.38.1762777722964; 
 Mon, 10 Nov 2025 04:28:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlXidrtTJ/SWo+IjP9zsPqLqPY8EnUauEJtqayLmsohT+XVNgx1nnDrtMXulJvKsAvoNmA4A==
X-Received: by 2002:a05:600c:474c:b0:475:da13:256b with SMTP id
 5b1f17b1804b1-4777329777amr70078655e9.38.1762777722548; 
 Mon, 10 Nov 2025 04:28:42 -0800 (PST)
Received: from [192.168.0.7] ([47.64.114.171])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac675cd25sm22203503f8f.22.2025.11.10.04.28.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 04:28:42 -0800 (PST)
Message-ID: <d3f15618-3f1e-4e41-9e0b-228923c78e42@redhat.com>
Date: Mon, 10 Nov 2025 13:28:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] RISC-V: NEORV32 CPU, peripherials, and machine
To: Michael Levit <michael@videogpu.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, philmd@linaro.org, pbonzini@redhat.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 liwei1518@gmail.com, smishash@gmail.com
References: <20251109191532.32419-1-michael@videogpu.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251109191532.32419-1-michael@videogpu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bp0OBPmSfZrkKf3Od2e6ZKyVrzNKUYcUxuw1v2Ji4QY_1762777723
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 09/11/2025 20.15, Michael Levit wrote:
> 
> This v4 reworks the initial NEORV32 submissions.
> 
> The series introduces:
>    * a minimal NEORV32 RV32 CPU type and vendor CSR hook,
>    * the SYSINFO MMIO block,
>    * a small UART device,
>    * an SPI controller with command-mode chip-select,
>    * and the 'neorv32' RISC-V board wiring the above, plus docs.
> 
> Tested by booting the NEORV32 bootloader as -bios and chaining into a
> Hello World from an MTD-backed SPI flash image, with UART on stdio.

  Hi!

Are these binaries available publically somewhere on the internet? If so, 
could you please add a test in tests/functional/riscv32 that make sure that 
the machine is basically working, so we don't face any regressions in the 
future?

  Thanks,
   Thomas


