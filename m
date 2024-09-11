Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5C2EE0210
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 06:13:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1soGat-0002yM-Bm; Wed, 11 Sep 2024 02:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1soGaf-0002Gd-Fj
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2024 02:12:35 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1soGac-0008MW-LL
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2024 02:12:33 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d2b24b7a8so101619766b.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2024 23:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726035149; x=1726639949; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kAumJrG5geLdw61qf3VpDc77f3fS/zuFfk+876iJiTA=;
 b=pFHXDtUlOEJn3g376T+93XzU3nRcqgsJX8PB8aJDeaPUF91CVsPY0vgW89lbRkcEn/
 Ino5HW1r7yxo2whlG2MbcTcHMhl6RYn2tZas0q5vsSnD1O8xzb4KUFhoLZzc14AJ1mrc
 +PQntBoQ9oxnO4WjZ3KzcsZZ7Zh5KMA9VWPSPaM0TQqudnj0L5W1XyIp4sHU6aoaLVvB
 tgOcHqvrbONSRJz8hP1WeX5f+FuwooIPWXwuBp6AxzDVCgY+rhGwQs+W+kdLxyEs511c
 YOHsCjQfPChQtigQHq51qHJY4qsn0nlRI6m6/Q+XH4XhB5IGx0W4U85KuyukLVNgI7pW
 wXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726035149; x=1726639949;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kAumJrG5geLdw61qf3VpDc77f3fS/zuFfk+876iJiTA=;
 b=bpNo+Fazdakjv+G46SyOjJJ5lQ6eyzmCoslYXTjNKJttl5R2+2+Kk3n7kUiDwqgMQc
 q0nIjnGI2b4+s5i7zI6ZKLxNKsJHPYGTt28ma4e/mIM7pqAn3NmNM026tFpVC3P2PPvJ
 Q5s4dTN/q00cmgmPs++6UNpjkzRpgKmk0WhsQ9gCPQCudkCG60JB29HRnxva+Z5ycCc1
 tPqEUKI0golx9lxC8a3fNm2WNAzDdoBn3zzHEYwbrGmnlyxNj0PwXRRL3ad3oU0qln0x
 nEORsQZmDmWkYG5RRqDUS7Tq9afwmszyWe+F3o8/JtTn9ePJB4t0NYVZ/kIR7ra9Li92
 cmbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFHUfk60JFQyBOd5Gk5wK69Lx3Xqk6GmGXNpm9IBtV0252ysXI2zlGlbUrtRJ/5kHz+R+38dSPt3SH@nongnu.org
X-Gm-Message-State: AOJu0YzTu3Q579fC0k70DeiaW/7JSgGbq9E9q0PHOp8q5gZZT6AxtC0a
 w29ekE2ACYsLfyGnYH5K9q/9OObUhKAihkd40pBT8UJQeg2rtixfUs52KhzN8eeJ4hJ82OmNHb9
 d
X-Google-Smtp-Source: AGHT+IGRY8ki3wghoo/m+frsHDdqzA0RIY8ueJyoMKlmKYbuDtkVoyqaJyXYcUASHJC9DbnG5ihtFg==
X-Received: by 2002:a17:907:9625:b0:a6f:996f:23ea with SMTP id
 a640c23a62f3a-a8ffb238307mr283396366b.15.1726035149030; 
 Tue, 10 Sep 2024 23:12:29 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.196.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d5dc8csm571366066b.206.2024.09.10.23.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 23:12:28 -0700 (PDT)
Message-ID: <841905bb-105c-4c42-88a9-ecbeefc2ad0f@linaro.org>
Date: Wed, 11 Sep 2024 08:12:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/39] hw/watchdog: replace assert(0) with
 g_assert_not_reached()
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, "Richard W.M. Jones" <rjones@redhat.com>, 
 Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Corey Minyard <minyard@acm.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 WANG Xuerui <git@xen0n.name>, Hyman Huang <yong.huang@smartx.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jesper Devantier <foss@defmacro.it>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <fam@euphon.net>, qemu-s390x@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>, Rob Herring <robh@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Jason Wang <jasowang@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-8-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240910221606.1817478-8-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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

On 11/9/24 00:15, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   hw/watchdog/watchdog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


