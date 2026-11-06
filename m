Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055E5606A32D
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 12:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T7z94SHu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xPIt2-0002Cv-Pp; Fri, 06 Nov 2026 07:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1xPIsV-0001zU-9v
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 07:17:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1xPIsT-0007CL-Sh
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 07:17:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793967424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=E66+2hYgpzZKUNNeBE2CQr7cNiXnuVWs/cIg8tZQJpU=;
 b=T7z94SHuegx86PjYP7n6FvXHLEN3TP6gED4LnCmJqcfsrmQH905EswWWk+Yrrq+I4HCr1w
 Xkso5LTJfjd1dKvw074eU/1/h5BEOmT9yLCyK3cYpFuF8cRvztIgFCU4ry92q5P5FhVXrt
 wF05J6Kn2kZaOk+SZsKcw+u2rtwNjE8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-Q5REiZ7cNUuANm4WtZ8K5Q-1; Fri, 06 Nov 2026 07:17:03 -0500
X-MC-Unique: Q5REiZ7cNUuANm4WtZ8K5Q-1
X-Mimecast-MFC-AGG-ID: Q5REiZ7cNUuANm4WtZ8K5Q_1793967422
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4a2065a2ef9so5063625e9.3
 for <qemu-riscv@nongnu.org>; Fri, 06 Nov 2026 04:17:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793967422; x=1794572222;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=E66+2hYgpzZKUNNeBE2CQr7cNiXnuVWs/cIg8tZQJpU=;
 b=TM4SFsJs7zHgaGSwifyZJVlXkdkXiY0dknqCmIUiYbpfs4nlYQITwJesWHvXAgZGeX
 537Mrfo63CIscEO+IMO6IQosxqk/6D1YIthOMiQF+e5FpkXIWU1nAAob6vvhWIRW6u49
 4jP5A5qtfkY81WBsX71uKuvqH9+WUc2CqHrDvyh9to+UEcnR6XsNcR1onVZB+VOHl5nC
 Ls3kW6t9Xkf9T9IAPuDldRXYnsdnj8u37L3WM/iFTAYBHJdCgwKC8luKMiWUf8cjDee8
 NFxuVsZY3HAYJIG+H+kgycGGTfIy/Ih2s6dYUuW3r/T/NiwBsr3Ix6pLF9Pbo386QSc3
 AJBQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzo2qeX61KDAA3GykLlXH6oBZABXyQaiHs193yAssfrte6WbJZSknGef0XHH0NnZMgYAkBNgfjG0uLR@nongnu.org
X-Gm-Message-State: APuU4Z8F8CLIq2l4OWsp9zxyj09GWZQ0wwj8niOP4QsAsZEpk3CCnxE2
 7eXa3rGMCtnNwzR//uBX9oBCOqB5wm1PCfah+pFFoF3uATZ1x9DxTZDRUpeLnUbfO1tJ2tSAY71
 cy6A90CnC6Dgkz21VYN67BTWckVJG0i/6i7PTEJ/EFOPiCM8OtPR7Fv1D
X-Gm-Gg: AYBFou19Z7b9C6rC50yk3Blut8tZLyHjltiQ02sn6Q3VDH9LpIQWmW+Wk8XUtG9TdTd
 VEKhIXPTYwcKjH5eBUgT3rB7saJdud2bPYAgHCS8OOu74IlI5KZzPks/12DWAPHOXnj6BL7QdjF
 Vvhc7GMk0XgxuodzkqlFj0teWumo9twIBdNae9odZDK4VsIsl8ZfJmLO5NFYcyYilNGjn5Y8ZaQ
 JteKsXIdxYFXOFhkR9vNdVam0wppKiuJc/te5PquTJA2VxU5Z7XhhfviA13huHijljCLUsUp2MR
 Cq8DWIpHTGo87zNDwhdHCLYSOfT1IFUDLqpNwAOpUDba/eDuKcJCWt4MrQDzDg1m11U7Mr7YOIK
 zrWxOhKB8K9ZiE8S5Xy1yBg17HLUZP3Zo2SIWG0K5emzmxlS+Z4SvH7rypWurTfOZEMvY2dqMh/
 EIGI/Nm93G8g==
X-Received: by 2002:a05:600c:8114:b0:4a3:5991:719 with SMTP id
 5b1f17b1804b1-4b6e0267f25mr35406015e9.31.1793967422171; 
 Fri, 06 Nov 2026 04:17:02 -0800 (PST)
X-Received: by 2002:a05:600c:8114:b0:4a3:5991:719 with SMTP id
 5b1f17b1804b1-4b6e0267f25mr35405495e9.31.1793967421752; 
 Fri, 06 Nov 2026 04:17:01 -0800 (PST)
Received: from ?IPV6:2a01:599:b03:7322:436f:1f3:b26e:91b8?
 ([2a01:599:b03:7322:436f:1f3:b26e:91b8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6e2028d9bsm108763355e9.9.2026.11.06.04.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2026 04:17:01 -0800 (PST)
Message-ID: <596e45ec-2a5d-4cc3-8c35-741ff8ee64b6@redhat.com>
Date: Fri, 6 Nov 2026 13:16:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/28] hw: define most common PCI types as secure
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20261029131241.2275706-1-berrange@redhat.com>
 <20261029131241.2275706-14-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20261029131241.2275706-14-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pAI75FkwQRGKaKUlZNmBSCJCRDvbFyCtc6iEStAHPVY_1793967422
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29/10/2026 14.12, Daniel P. Berrangé wrote:
> Essentially all PCI infrastructure is in scope for the virtualization
> use case, aside from the niche simba bridge and the CXL related pieces.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/pci-bridge/gen_pcie_root_port.c  | 1 +
>   hw/pci-bridge/i82801b11.c           | 1 +
>   hw/pci-bridge/ioh3420.c             | 1 +
>   hw/pci-bridge/pci_bridge_dev.c      | 2 ++
>   hw/pci-bridge/pci_expander_bridge.c | 5 +++++
>   hw/pci-bridge/pcie_pci_bridge.c     | 1 +
>   hw/pci-bridge/xio3130_downstream.c  | 1 +
>   hw/pci-bridge/xio3130_upstream.c    | 1 +
>   hw/pci/pci.c                        | 4 ++++
>   9 files changed, 17 insertions(+)
Reviewed-by: Thomas Huth <thuth@redhat.com>


