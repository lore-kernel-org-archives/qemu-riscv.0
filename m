Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AD6D735EE
	for <qemu-riscv@archiver.kernel.org>; Sat, 30 Nov 2024 06:15:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tHGkj-0004nl-1w; Sat, 30 Nov 2024 01:14:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGkh-0004i8-84
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:14:47 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGkf-0002GB-H7
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:14:46 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-21290973bcbso24177845ad.3
 for <qemu-riscv@nongnu.org>; Fri, 29 Nov 2024 22:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947284; x=1733552084;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5csVjrGoh28OAUAki4L3dqIWI/wSyCSHOlktOlqqTn0=;
 b=ZRR2R4s4lU9xHig3M4vO1oQMj1e3PNMRWQpz2tbXY/z0jeK38YYEs9xqUvf1U4bfLd
 XwkYZU/B6v3kIWzTP39eGQ2KbIbZKikdHpvcwQbEcs+sxZ+DL1nlYuOC6tyJjGUuG+W5
 wdwE4nEf8yph+Z4qH+ZvkRKQn+QuSFHBAJJVVg+LTZxsTIbOmIzt87h3GQTA2IlXu5cr
 6a+rTRY8b/0OBNzZaWri7PuG5DrbLkLnpPsRpQrbBLSvWt7l20UV9KMUBoaYLqa92CVl
 vDlbGndloycmBBw7NxqVW+cjB0S4BHugZ11UV+Pvd0kUGO/8LWtR17nqMpqzpwNH37VN
 i0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947284; x=1733552084;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5csVjrGoh28OAUAki4L3dqIWI/wSyCSHOlktOlqqTn0=;
 b=G6wZFW0QcsrrkirGzYtQLW6v9gSFnRl7hqzBJI/lJP0IFLJlAyPbfhsNeLpgwEWyL6
 5yrUh4crwtOIk4xQZWQeUkCIkX93Ouo06ceZgKqSbNfK2bcue5FhQReuvDEyZaM+X3p/
 Y1hnNePrg1KG/kIBJUoeLvQyzEfnQHmJXH4FWjW68sOgxNjRllajUdKtriO86R67/eNt
 RPeZyKX57oBlhfwRELHdmcaKEKqrDVe1L8nG4rgGqzkmb1xDfiO2cXyWGLl5RcB5MgvM
 b9XWJy8MeP8VSN/ULY0USR4E3m0FyJHl/M7q4KFqCO6lSMElyX3uOkleaaCROcY8lhRB
 tAsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH37Ld5e5pzQ0RKPLto76PFmKRuBHStwAgVu6fLVv+ovfknkdyVI9pPnXxyZBgUs8KXwyz9fT8Io9s@nongnu.org
X-Gm-Message-State: AOJu0Yx899v3g/jEIS02DhbgpCkKxjVnswIv+d546X+09Hgi9xLxs9xW
 POmt6l/XTXVw//dfFK/5KO+HXITPv9nYBqk6skaTxclN0crQd55aN46/dj4lHU4=
X-Gm-Gg: ASbGncux3CiZ+CuB0U2XIe8s8Daxwk/8xY0+OiCM7eAbhF9pa2f/3twBTvneVO96qDL
 YhUdOFwD5UhJPG3EYBcRWhQZ+FLUTcr0ioAp0OoOTjJWuUR2P4QocjceStWnC55FJrt5mnJ6I1i
 j2Yz/ud6FLtKdi4h2s0me2wdefs70NDXMBfDdc4reUs9CwcLc/W7TaHcAN8QjOdawKSg+zqJKXF
 7cTcKfoyy8X8aGiCPCNUA7Ujg6hfJI7cPruyaCEw48p1hMPK3rOzeWHcWFhWI8=
X-Google-Smtp-Source: AGHT+IFum8fHMKzFU19YOFN8+uBJ5s+EfvYaWMtm4Yz5c/HPGPsVtBzudWtNiGpEBr6csMP5VKj6Kw==
X-Received: by 2002:a17:902:da91:b0:211:aa9e:b808 with SMTP id
 d9443c01a7336-215010854d6mr188611005ad.6.1732947284254; 
 Fri, 29 Nov 2024 22:14:44 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21539e88cefsm26903535ad.182.2024.11.29.22.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:14:43 -0800 (PST)
Message-ID: <446f2514-4ac5-4672-8be4-726379939b2e@daynix.com>
Date: Sat, 30 Nov 2024 15:14:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 06/15] hw: Add vmapple subdir
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu,
 Alexander Graf <graf@amazon.com>
References: <20241129152506.59390-1-phil@philjordan.eu>
 <20241129152506.59390-7-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-7-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2024/11/30 0:24, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> We will introduce a number of devices that are specific to the vmapple
> target machine. To keep them all tidily together, let's put them into
> a single target directory.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>

