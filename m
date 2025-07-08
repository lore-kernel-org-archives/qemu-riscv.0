Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742EEC8303C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 22:04:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZGPm-0003w1-SE; Tue, 08 Jul 2025 18:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZFq0-0005Oj-Uq
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 17:26:53 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZFpx-0008P1-I6
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 17:26:52 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-453398e90e9so35317385e9.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 14:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752010008; x=1752614808; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mj62iE3xvIhy4oJ2TkanIiJSkBpd3fDhboJjZRfVaSM=;
 b=Qal0vdr00B8ObUs6l6VIu0HoJUsxgOUrMYcvzOdr4Y4fvoLpGvHb8WTLHPr5JDL7EN
 VMalk7jqy5ptyMBsjb7VXn9MGRVXlJWLsmC191ihqilqRNeBOWtR9OKJCc/d3zlLBdtt
 L63m3hSEz35oQlH93IFG/WaNcsf82PLcrsvrlBk9OB7h98/seKDrUYPt233Y1gqkCK6f
 g1OgKp6Y47j8XUe6/T+SA8mRqtaL07kfpTbGBVN2BHOw31ZTElsFTA/CQLOOiKAIWIWX
 4xC8Ka48mOuAMxI04HzCJBZWHNsxHctjhYFaT+tv30KX38W7t0wNp0eGcYg/gxBHaxQj
 0yVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752010008; x=1752614808;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mj62iE3xvIhy4oJ2TkanIiJSkBpd3fDhboJjZRfVaSM=;
 b=AbCjoxTLpU0zFA4asDakdd+UvvyPTPttT5HlTAyhvrsY1ZQMlX5hd43QAtwvDPKj3M
 3S6I/KW3RyBcsCwYuwSP+EYeooR69gF1UdfGgiWTU00PnXQA+yAcrGkT4mmGiwTfwlIA
 PFagHQjfa6O6v3hjHP46r81mjMyLh94HcQ8lkDz2Svv4Wn7ulB0D9kjctvlifWrcXeoe
 vDoTpjMavwVzqJfYSbfSpETtsfMDs0kYOUUPYwdU1S7vSLG7oec2r0Ebwgc+p34TeZtW
 RT15GVc7ZrYMlraxMpZxyL+HvsaJQiItlVLcQmZ8fT971GlEHpocJGbxy9PCacyBzYT4
 mWkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYvNURpxHM3ykZmhMp497CrkfPk0dWMAUmYepjHkDhsTF18rkWh4Dhyxtu2IsHkyJJ5AAiASJr66Z6@nongnu.org
X-Gm-Message-State: AOJu0YxypGJkcgPO361X3edMiR/kjJUF+uWvAP47+2+DIa2ujOTI5ORJ
 iMpCBTBhQUmVkrLcocj0HQWl/j4g3BRzmAsv6nhiOgcZNNKxoG1D5Hz+T5Oo6QHLaCM=
X-Gm-Gg: ASbGncvZ3q95n2cblJXOo+FsTov/oJJKfFiNrlkquQi09eSwYyQu+uP6SM+wx31Yz34
 EnHixZ5QBwuK++j8yTd/Q5TxLJqY+BkvO2RwtAZNv+J7oSz5z1+z9s89iM+xveThvfD37TRJm7G
 X0nKFz2/Un4FOa9h7l7mjKpAO50dkcR2IJhQbnNRxrTxnUirgk6ktYsbkVzRuDBfwApQoQz31gb
 5wPgP0TofJz6K7ss1wzZoNCW/2xJmHThmI7D4vmbPfAs8u+9hwgYh+jfD7JRBqbxUylTb7jO+S4
 K+8oWjvFnerAM/rtF992BPurexWSnjCVGqxRrqj4gu2pCQl50V5Oze0eGNGI7bpmIgbF05Wrvhy
 pR7AJFSl8BIjx4bP9LLlxOXDWkFu3xFfPup8LAmss
X-Google-Smtp-Source: AGHT+IH7rikhE5eGoGKvue52ZLKzQXfj4RFx6aAaqSoMDyaSOuJYfO3dAWy220MnJbN3DzViz650Fw==
X-Received: by 2002:a05:600c:3b01:b0:442:dc6f:2f11 with SMTP id
 5b1f17b1804b1-454b3169103mr167683295e9.25.1752010007660; 
 Tue, 08 Jul 2025 14:26:47 -0700 (PDT)
Received: from [192.168.69.242] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5dfd4657dsm2381214f8f.17.2025.07.08.14.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 14:26:47 -0700 (PDT)
Message-ID: <b1ff31c4-25e7-47a1-9579-095e7978e4a6@linaro.org>
Date: Tue, 8 Jul 2025 23:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 4/8] qemu/target-info: Add target_endian_mode()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-5-philmd@linaro.org>
 <d182e9ee-afae-41fc-b160-971cd909b9b9@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <d182e9ee-afae-41fc-b160-971cd909b9b9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 8/7/25 19:36, Richard Henderson wrote:
> On 7/8/25 11:19, Philippe Mathieu-Daudé wrote:
>> +/**
>> + * target_endian_mode:
>> + *
>> + * Returns: QAPI EndianMode enum (i.e. ENDIAN_MODE_LITTLE).
> 
> s/i.e./e.g./

TIL i.e. vs e.g. :)

> 
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~


