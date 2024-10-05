Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E93CF8851
	for <qemu-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 06:14:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swy3m-00028U-Ev; Sat, 05 Oct 2024 02:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1swy3b-0001y2-N1
 for qemu-riscv@nongnu.org; Sat, 05 Oct 2024 02:14:24 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1swy3Z-00019Q-JO
 for qemu-riscv@nongnu.org; Sat, 05 Oct 2024 02:14:23 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-71dc4451fffso2826395b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 04 Oct 2024 23:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1728108860; x=1728713660;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oucCD6GmvM1AxZvz00WRd/F6EZ16LhJ5WCAB0EFZax8=;
 b=UKONea8f94iRc7xRis5UO5Mhc50Lq0Ci7AAORzMIJqmFvR4Sj831btTEnsaorDGF17
 FFv5MslE/AWmwMGdVsiFZwsL6jPUXXObjbhvpubYHaAidvWyb90Eq5N55+JsxVwDUpjm
 xN7YLrr8LFA7CxZgOMBsQjIff7YPL+Rh7rwT29qKf+e80U9OKISE2lS+RT4A60h7H55S
 SnqWfuzhfIB8EO9U3fb+JspPrSYRJoTtnPm1ZnMhM4U/6x2uFS6b/UQd1E8sHFEkx5+s
 7QKzP0hiRKFz5Uusy/ihuxzwQMgXQuo3WLVYCWqyFBwnF49Y4w29Yibs6Nf2hbAvYn1e
 ygNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728108860; x=1728713660;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oucCD6GmvM1AxZvz00WRd/F6EZ16LhJ5WCAB0EFZax8=;
 b=MeIHY49C98iwq//4uzl843IDzfvUc48bN1OExTIqurvdnCFzEa9V2FOgu623g2Ueg+
 ZjJJcsFstx7pd+ae1I8AQmOjsnuOdqQx+TT4P2gcwI1OlFQz3O99aBAtg4/laToEaIwC
 43MNVOQ+C52m3PjDTkej5w4ILrHGJAkyJHMt0dNgaOarQ8qrfP4nL62ywm6/3EM84vTi
 eXydsJcmop7TMT5nkelGgB/GPzSIT99zXYnm6neg9XsUgqOlC7QDHWcdITxO81XhcAYa
 GYlscdq5EjrYwgME8PqchvKXekfPAdRrVg7xZeMppyUhBy4b5xNMbuhoeFZSdsjeWHy6
 dGBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFaHpLD7y8dpHESRxhIGvdxQC1XZ5g+uTKkUustilNQFuKlKnlkJqpJ+Z8kWB6mtJPL/Dys4PwsVEq@nongnu.org
X-Gm-Message-State: AOJu0YxE0L3FjZ7GiceG6A8r/Q0W1025wqTn6ymthcXcJMQc6l/pEcsW
 y6jm6pARa83QF++Z3wCDKfwFehRmUDwmJZL7ZCq+DQE3LHLaY6D+76teT1LBiXE=
X-Google-Smtp-Source: AGHT+IHZhobYwD4h9vTuvriEo/QQpRDN7AXz4p2p4cLd+DQHaNKCdohXUgK2lp0BIbgcNTxbwijU+w==
X-Received: by 2002:a05:6a00:3c83:b0:717:8ee0:4ea1 with SMTP id
 d2e1a72fcca58-71de22e8399mr9376019b3a.0.1728108859995; 
 Fri, 04 Oct 2024 23:14:19 -0700 (PDT)
Received: from [157.82.202.230] ([157.82.202.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0d69246sm834048b3a.182.2024.10.04.23.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 23:14:19 -0700 (PDT)
Message-ID: <a67552fd-f304-468b-bffa-9d2a98ce5a5e@daynix.com>
Date: Sat, 5 Oct 2024 15:14:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] hvf: arm: Ignore writes to CNTP_CTL_EL0
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 Alexander Graf <graf@amazon.com>
References: <20240928085727.56883-1-phil@philjordan.eu>
 <20240928085727.56883-9-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240928085727.56883-9-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On 2024/09/28 17:57, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> MacOS unconditionally disables interrupts of the physical timer on boot
> and then continues to use the virtual one. We don't really want to support
> a full physical timer emulation, so let's just ignore those writes.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

