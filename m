Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kaks9-0000tQ-9V
	for mharc-qemu-riscv@gnu.org; Thu, 05 Nov 2020 14:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaks8-0000tA-4M
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2020 14:24:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaks6-0007yX-5h
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2020 14:24:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604604272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2O2ruTJDKXNl/n9kvytmN9JsVNZAyj9m1mgEVXidQ9I=;
 b=SN9E8a6CKHVOPJBhyGNCBN2krnFqrHCwzNpEdAe51hjfsd7gNKEQxtGhiUwgG6CzJt7QI9
 1yDSj9lz2yuZwXjUSPNpD8YYZOULzpKCmUu0d4w6Rv1mIaEUHEK6dRFix9Fx2v2fP7j+od
 MOjhP4fnvmS7XsGl1c1AK4Ffo1+Gukc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-8sVm12wDP9WjGneaq74GZA-1; Thu, 05 Nov 2020 14:24:31 -0500
X-MC-Unique: 8sVm12wDP9WjGneaq74GZA-1
Received: by mail-wm1-f72.google.com with SMTP id h2so1014523wmm.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2020 11:24:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2O2ruTJDKXNl/n9kvytmN9JsVNZAyj9m1mgEVXidQ9I=;
 b=NJ/dsGQ6957kOeKokV586cmxjnGBL7lANd49VwDyoyPF1FpnZfBsNQdjkPX83AyRtW
 PCYCgk3j/1LPQ5Q4gq5MPkFjleKfLC82TJx7s0Ws3twT8UB09bKmpXFRwsMYTDoRMDhW
 mv5XVaMdOVeqgtIlsmLYO4Qbdtr1Sbgay8RmoUpeCBsmEbK06+U1l1hzg+b/qtoAzMLZ
 hH/U1n/pOTrcYpjYizYbwbPCkbuxRvfiBOJ/4W5+dhBNNvZRkVLl+B+Oh5QFBjx+pIJT
 ePAYvu9YsdiLsjmVX9XBX0DaVAjKf+aiYs1Ttt0578G1DkzLTIePL2RP5931zn4CDbq9
 Kkeg==
X-Gm-Message-State: AOAM530QqRDskPDJcgBqJTKtgszCK6xrLjun5cfnwKJQmAyILrRO+HrA
 1KCTyF2t3q0wOzjLEBJvjdqb+/wNjqub41yrwRbsnLZCkcRekYHUT0LY6co0LEO0Y1mdm0sdptd
 F4SPY/3wuBI239AE=
X-Received: by 2002:a5d:6147:: with SMTP id y7mr4598618wrt.382.1604604270100; 
 Thu, 05 Nov 2020 11:24:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEEnP9tYB2nupxw5lVul+64ZPOpvZsWLQPB8FD3CVf7xP4+XcUo5RP3z+3hObanYHXT7W9gg==
X-Received: by 2002:a5d:6147:: with SMTP id y7mr4598598wrt.382.1604604269974; 
 Thu, 05 Nov 2020 11:24:29 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id p4sm4321808wmc.46.2020.11.05.11.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 11:24:29 -0800 (PST)
Subject: Re: [RFC PATCH 02/15] hw/riscv: migrate fdt field to generic
 MachineState
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: julien@xen.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 masami.hiramatsu@linaro.org, andre.przywara@arm.com,
 stefano.stabellini@linaro.org, takahiro.akashi@linaro.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, stefano.stabellini@xilinx.com,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 stratos-dev@op-lists.linaro.org
References: <20201105175153.30489-1-alex.bennee@linaro.org>
 <20201105175153.30489-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1a3f0af5-bc74-1f90-5900-c6c68d8bce21@redhat.com>
Date: Thu, 5 Nov 2020 20:24:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201105175153.30489-3-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 01:14:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Nov 2020 19:24:36 -0000

On 11/5/20 6:51 PM, Alex Bennée wrote:
> This is a mechanical change to make the fdt available through
> MachineState.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Message-Id: <20201021170842.25762-3-alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/hw/riscv/virt.h |  1 -
>  hw/riscv/virt.c         | 20 ++++++++++----------
>  2 files changed, 10 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


