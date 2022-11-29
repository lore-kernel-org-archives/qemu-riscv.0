Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozqHB-00066J-ID
	for mharc-qemu-riscv@gnu.org; Mon, 28 Nov 2022 21:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=325583d4e=wilfred.mallawa@wdc.com>)
 id 1ozqH9-00065n-Km; Mon, 28 Nov 2022 21:23:12 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=325583d4e=wilfred.mallawa@wdc.com>)
 id 1ozqH6-00024F-Nu; Mon, 28 Nov 2022 21:23:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1669688588; x=1701224588;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HFbRKGde+btgIH+r30McMgKCcQNQMij2VCVKSw0hi2E=;
 b=Pnx1gxHE9RTDSnRie83j2dyycyHGuRzrtaC6FmcJUhcA9dr4vZkR59Wt
 xkgP8rJiiOzLWw6chYWjwkgG5ZnT+gOLI7mqMZhUGXY400+Y0NEbM+C3M
 p1nGB+lYRWQ56wAFihaihM59YvVN8dgsCP63xS8FKPnAd4HljhWCU3uak
 2wSCKOxnK2KaqqPpi473TS/1n89UYN+SBW7gaVzI+bWADgF0ztzAj2jvT
 I6m/tV1I7zI2ySKaidejbz5VEUc4BdcCEo86Nz8M0K+MC/+O0sGtSgv5J
 Yn8kWMVF+B7jB9+nKtNJNRgjchYFAfZKshBY2INV6oOTF5R5oulTsYV3a w==;
X-IronPort-AV: E=Sophos;i="5.96,201,1665417600"; d="scan'208";a="217404338"
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hgst.iphmx.com with ESMTP; 29 Nov 2022 10:23:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmy4dKgx2wwZyHh2u9PqjAHUyeBuLgwoh2FeLfmU4MpqeDw4wX9ROP/56H8eQNEpXpTIPTlnGV1gYa67AfNqVtUEo7VsYbrkFf5QrC21/34HcxZAwLGGcBmssG4TCVZ8RGYJU3OEI+WEYninOWy86enS0i8IUMTirBGohyvH7ZqF9aKdpTm3lpVYWDc55jTkae8zD9hbcSF9dYGijfDdLvKMuctWa1m6mgONqHvaFwCfMdFYUg4XaP0xRgDiN/tVc/TA+xZf1VnpsVxUz2o0S17Xjjn6NA/GdPIlDXZ/3JdNf2TXc6OIqf0oUH2sp3Sw+yBFfF9iPzHUipGcy1PcgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFbRKGde+btgIH+r30McMgKCcQNQMij2VCVKSw0hi2E=;
 b=LciDhixG/8H61mpPzCLZGXjzjUTaY0UAiZcKjFsmtlzHqEIFPhItwdY/ODhwNxoKYeLG5D5Rj7u/q5RnMVGg/PB0NNPAiof6xlV58Dybs165TEuu1E2rl0KoZxHQZN/3+2OUfeIFJBGxbelgQW3HxG0QARjAhXNn/qKbrC2ORG+/Wehj9TapDYAxwZWJthclGJO7GhiGHiYFxSGDzjk3eSfFEtMOPVXvPh/dwMw/lQNRK52HrNS8Zgcj7yGVH9Ih/WG/3O53r9rgGM/0dvTrmNAWPzqHRkf5Ou5uGd4L6vztr3vQ8W92PtIBrRoCgGBcM3JpZt5/MHrlBUnJ29bLEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFbRKGde+btgIH+r30McMgKCcQNQMij2VCVKSw0hi2E=;
 b=LVy1HLP00At+FJYHcTn1EkUsGkYm519W45UcBzWWRfpu2Rb9ocaaOiprrx1dWAH8NHBVsiI072MF6gD0SpSXVP3rfdG9BTYTTEKVv+Rntduw7AGznerFr0D10menYEsuxu1paT2isWUGwANBKGTxtU0e3spoFHcUVRZpSRm2zA0=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by BYAPR04MB5269.namprd04.prod.outlook.com (2603:10b6:a03:cb::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 02:22:58 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%5]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 02:22:58 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "palmer@dabbelt.com" <palmer@dabbelt.com>, "bin.meng@windriver.com"
 <bin.meng@windriver.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 "liweiwei@iscas.ac.cn" <liweiwei@iscas.ac.cn>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
CC: "wangjunqiang@iscas.ac.cn" <wangjunqiang@iscas.ac.cn>,
 "lazyparser@gmail.com" <lazyparser@gmail.com>
Subject: Re: [PATCH v6 2/9] target/riscv: add support for Zca extension
Thread-Topic: [PATCH v6 2/9] target/riscv: add support for Zca extension
Thread-Index: AQHZAyWBK/m8H5sF9Ey+r0QDz0pVoq5U9bYAgAAqowCAAAxXAA==
Date: Tue, 29 Nov 2022 02:22:58 +0000
Message-ID: <9f3faafb2e4ac9222047d1a2d6c27bd2c178bf74.camel@wdc.com>
References: <20221128122913.55611-1-liweiwei@iscas.ac.cn>
 <20221128122913.55611-3-liweiwei@iscas.ac.cn>
 <421c4ba3559b6d83e8a348766b7a77f9e1268bf8.camel@wdc.com>
 <3f606e08-749a-22a5-d4a5-6668fb2dab81@iscas.ac.cn>
In-Reply-To: <3f606e08-749a-22a5-d4a5-6668fb2dab81@iscas.ac.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|BYAPR04MB5269:EE_
x-ms-office365-filtering-correlation-id: 7ae23eec-336a-45ea-372f-08dad1b0a19a
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5DBhp7djgPdeX5pnma1Raqr5kxGGNlTqDFDfdTacC+6Gu+4058SfWVYwmJ0EqgiicPN587UmSupqVmWAFZfWTrI/3py+iRrnwCyheidfEWPAt1X7BiQiEJnrN8hVIZBHQEylGLslMp+/lfVbLHZVSEdtVQoGiVGRI3w93+7lDpyf84ZfRk23Vl8AiqtgOqp4g+3OGGP6X7vE6PE4joYWZYJv+u7y5A6e8Q7jKVjVl9l9uKa9j/OrQFA7C5HM8ETP5ShLM1ndXWIXslH7oMTM57Z+pN3eqCgG4M4T/O3+ex1fzZmDQo7o9amHTDWV8UDGJOXZybB6Y2O9HJNzEwfY0DoXWvq0qCCTi94pcTZ47gyQ79mIJ22sAqBnh7NYBZzkLEQ08Q4fgaNLzd/a2a/BEHPz6o5o4EKaA6yJxrUg+XTiD2+DpOC4sNmZfXkqFRDm/wBs/zGkmKk03DjsqNgDGBolU7ANcl3QhZIyYAHRVcT1uClgP/cnpDxQkCKNuV6QGurAIaWtBxKj5iBOBOS0nJU8p15gVXLUT5Tqb/+3lm9Yuz5tVuCVh5Qh5X+8QYmp7km4539ylwnVI/OEKLlHsoxAtxRKgiGeiwJku9maT3aUn+W1Ij0YWIOaJjidhn//XkbUBOd3A9PXJnw8jRr3ewQrTh5A15Jt19C1qTZC0lZD00h1hAIIFo5rtN6T7j6FhJ0TQd055dsyADqIflYSPg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199015)(6486002)(82960400001)(478600001)(53546011)(122000001)(186003)(2616005)(83380400001)(36756003)(38100700002)(6506007)(6512007)(26005)(5660300002)(71200400001)(4001150100001)(44832011)(8936002)(41300700001)(2906002)(316002)(66446008)(38070700005)(110136005)(54906003)(66946007)(66556008)(76116006)(8676002)(66476007)(86362001)(91956017)(64756008)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1BpbHdJSk0vWVB6OWlTdWk5dlZzZW5iR3Y3YnZKbFVtcFpxdmhWL3lIVXF0?=
 =?utf-8?B?Y3VibjEvVnZaUnJVWmRwSFBvdVF2NGh0OVhEd1JTNkxFOEdjN2l1R2U2QXdj?=
 =?utf-8?B?a2IvVEJFMFJPZnJGOXF2bE44WUs0NWVVcXhNRjdxUEo5ak1wMkpCU2x1NTFX?=
 =?utf-8?B?amkxbEVqYTRYK0VtY3JnT0YyRzlBcVhKdFRrRmdhak4xbDliLzRCM0t0aXRN?=
 =?utf-8?B?YUtCVGh4SW9nazB2Q0tDVk1LN2hWL01aM0lvR2VtOXMva1NST3JLblZrS1JC?=
 =?utf-8?B?Z2s2eG5VeXk5dGJpblk4YUdEU3M2YkNhMFFwWHRRWWJ5NktUYjQvS0tyaE9G?=
 =?utf-8?B?amRieFZTeXFFd0ZlWXNVMzNKQTFBQlhxcUgvMTlXKzBwYWoreFcxSlJCNWJx?=
 =?utf-8?B?NkxmWko4K1o4Qyt0RDhCVDJPWWlzZS9jT090RWo1MU5rUnJlWGp4ZGxiekZ1?=
 =?utf-8?B?R3BtZU91bXhRUjJsR1grd0RhK3RFQThOZS8yQ2lCak8zT1NiOTlyV3hrdjFJ?=
 =?utf-8?B?RVRlSE1OV2hvU2IvMzFJZjI4dnJVeUJVanBndm40MHFrd2pSUTh3N2NZWmx2?=
 =?utf-8?B?N1diUGN4dWlGYnB2NFRkRTc1bnREU0NJaTN0dHNmdUdqaXZxK3FJZ0hFYmN4?=
 =?utf-8?B?ZkZMcmMzK01HZ241ZWhxcmY3YVVwOXRLaDBraDRDVERyWGpJd2hMR2h4bm9v?=
 =?utf-8?B?ZVJveWVuV1FKQm5uQnhCSGJpaEVpaUNyLzR4bEZPeUd5M1piV0VPamhTdE12?=
 =?utf-8?B?OXY3Ynd2Y3lMMHlvcklyMGZtbFEvbDR6ZVgxMndNK2hXTm1ld0tyOUpXTSto?=
 =?utf-8?B?cVZ0YjExaytwaDd6WG9WME5vVmdhK3I1Y0h0VnVDRU5yUDduQ2cwb2d6dUo2?=
 =?utf-8?B?MHQybmhCZFE0NFVwUVk1aXlRRUtPbEVLUGt4VUI0ODBjdmlVMTlsS2hTeDR0?=
 =?utf-8?B?SnY5K1k2V1h6eXhJakVTd2sxcWlHRjhENEU4eEJXVU9QTEpiWUVmNjVJUEFI?=
 =?utf-8?B?Mm9CYUxiNUU3SXNUZVBTTDZKN1IzVWtVbVNIOEN0RlhPczNYSEs3anpMc1Fx?=
 =?utf-8?B?cHBUVlZxeGV1YXd6WnltWGhIY2RsN09Rcm1PZ3R6QUk5djJZdXorQVk5MXlM?=
 =?utf-8?B?enJsYXFkdmRsQVFJYmxvNGgwK3RtRy9BUjNRTW1XOHhTZlFZQnJCdEFNNFFN?=
 =?utf-8?B?OU5kaExxa2g1Z3ZqcGxYcHVKSVU3andxUGY2a2pUY1UvZWdaK1RvY0xkVXlj?=
 =?utf-8?B?VWFDNVpOWFUyZHp1QTZRY2VzN0c0REJoNk83ZVBIR2xPVitGaEEyd0RtWXpL?=
 =?utf-8?B?eGVmVlRybHV3cDZjT295VnNqdytDM3dpc1dFRU0xOVU2U041cjZxYVo3a1dS?=
 =?utf-8?B?UHJQcm12dGtnWVpmYWZZcTBtMlZhZW5KV0pjWWVjclk5QXIrd2RuZVVQcy9J?=
 =?utf-8?B?ZXpwNUFoM0Q3YUF0MHcrcVlYUktyYnlYSElJQ0REMzNGMzBnQ0FONXlhdzNn?=
 =?utf-8?B?eitGRGJnaFJsSGwwWkphbUlLczJ0djJ3a3NhMUlNYzdTa2xZdzNKaTFqUzlE?=
 =?utf-8?B?THFqd2p0ZVFlMktId2pLdy9LM3lOSlBqM2E2eEZ6NVFEWENvRWwwcG5QMVRp?=
 =?utf-8?B?ZFYvSUQyeWl1UWFwbUpEV2JxS08xR2U5V1Z3UWgzYXA5MEorMWJONy9JbmlD?=
 =?utf-8?B?MnIwTTh0eFVBQ2xWRDdRdWxIdHFtQUFQTDlPK1Ird1JKaFErZThFZ0xhSnZx?=
 =?utf-8?B?blRQcGhoWlFGTjNqMGNtZzVvbitxT1BXTWQ4MjlYNVdUcDJJQkJISjltMjQ0?=
 =?utf-8?B?eS9jVFRxR0tJY21pZnl3dmpYMWZvUXlnSUFlYnJhS3FGcFNUajBLMGplamZE?=
 =?utf-8?B?VHo5Z0Q4L2RrMVpHM0hPQ0c1cmZyRmdhU1EwK3RibUU4anRlcFQ3QytJK3Az?=
 =?utf-8?B?Y0FnZEtwTU1EOVNoOFVwZHQ3SXIyd0w1aGVuOEs4Z3NQaUdmV3J0VDVXTHhG?=
 =?utf-8?B?aU5TQVUxM3RjYXRUV0Y3eDFheG1aSUszTkI4c0lsdGplUTRJRVQ0TUhHck12?=
 =?utf-8?B?ZXB1UGI5YWpzRk8xMW50RnFOYzQ5cEpKT2RUNEVyc0NMVHA1VEU4a0JxZjlX?=
 =?utf-8?B?dmpmSkFTWmZlSkhldzE0cWErS0RHazBoR1hHV3AybUpTWmdrWUxLUmFTMkd1?=
 =?utf-8?B?MWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFEAD4031661964BBB4871F7F60B058D@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?SHViTnFVRW1FclhjWGN4czhHaWJGakxYdlIrOXEwTWo0ZFlQaFRCalNXRmxG?=
 =?utf-8?B?c2lVdktqNkdvcXFwampiNXJSeU5jdnlHSVdnaEhBaTlKMmszTlEyTlpLTGpw?=
 =?utf-8?B?VlhKbWsxVkxsSnF1ZnVpZEE5L09GNzdhazBneWk3b2loOEhVd3dNVUNMb2ds?=
 =?utf-8?B?UlJ1WFY3bkVRSHpQb0l6and4dExQcDFyNlozTlRYUkxvTVZOTHM2T3ZnTzdM?=
 =?utf-8?B?NWhSbEJBUWRwRzdzMERsTU5ZU3lvaVlyaWlldFZQZHNVcm5OZmNraW01VFZV?=
 =?utf-8?B?RFlpZWJsVklUNG1pV2NQTjY3VEprK0lQWUFNV1YxSmsxbzArRGRmOHFVVVUz?=
 =?utf-8?B?N2Z4aTNRZDc2Mk1Kam9DbDZrbGM3NFhjVzROUXMwZGlnR1gwaTJ2TVdMZk9v?=
 =?utf-8?B?MkFjNkhLNDdwamIwT0l1SDArMVg5R3krcmROajdwV2UyRmVuN2tCVzk4dVBV?=
 =?utf-8?B?QXFJTTd0N3BtNXNzUit6SmNLbW0vclNORXZsMzV6ZnZwb045aWdrZHJuQ00z?=
 =?utf-8?B?KzdTcFJmaTN4U09EbW1tZU14Y1pXaEJuVHN2S3Q3NzZQSnFzRW96R0lCSGJR?=
 =?utf-8?B?NFovbUQxVzhGUzdjK2JyK1N2R3dWaTluZVhHeU9qSmloU3hZWnNNNnp1MitT?=
 =?utf-8?B?OHhoWHZaV0FITFZvZ1BscmhtQTRPbzh3eVB3ejVOcVcwWkY4VTZ1b2ZUNUtk?=
 =?utf-8?B?TjE2YXFTU0JmZXhkZ1FkdEViWnVON0QwYjZwYzZJelFZS2F4eHN2UzBneEFU?=
 =?utf-8?B?ZC85TzBUZGhXbEFyTkpLTDUrR2MvVTBvaVYzbEduUGdGT25nRWdLdWV1QWtW?=
 =?utf-8?B?WSs3OGNlSS9YTmEyV1R0SjI0TDdJSURwM1RUVTNWM2Exalp5NTFXV3owNmI0?=
 =?utf-8?B?U1ozd1JxZWw4Z3VIUXFURVoxVXRrSW5CeEtJTWJ1NisvUFl2RUhVWStYQW5j?=
 =?utf-8?B?cXFzWUxDT0VEMlJ4aEtkeFZpakdzaUxOdHZmK0FvOUVteU1yaWdRV09yU0M1?=
 =?utf-8?B?VGZ0dmNXUVlHRXk3MzRDY0FlR01nZE15NnU0bm91SE9Hcm1ISDd3ZTBveGYz?=
 =?utf-8?B?TFd5VVhQR2M1RlRMQnJEc2JSK0p5YUE1YW9ZaDVtS0pWZVd3emdmeW4yaUcv?=
 =?utf-8?B?SGgycFRCT090K3FaR3N3U250SFZDdDcwZWtRTUtsOGJDZU9qYWNSclNBMWtx?=
 =?utf-8?B?cFpJVnErVEJqWkVxL1VLRVRHbnNJcEl0eDRmRk5tUDd2b2pWekJqSzhybld0?=
 =?utf-8?B?TVJLY1BqQmN6akp3RFhkL3hEVVFzUUxYK2hVQlpyN1hBMkMrMWFtQjJlQTR0?=
 =?utf-8?Q?1aXb9R3qyoA1U=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae23eec-336a-45ea-372f-08dad1b0a19a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 02:22:58.1721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f1ZDROaZkXnf+pPLng3rfgREG2OlnANlKQY3ZVqSR3foARnfBlZqZGNtvnXm1M+RxlqdvYOzqmsXIJBpDI9jgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5269
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=325583d4e=wilfred.mallawa@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 29 Nov 2022 02:23:12 -0000

T24gVHVlLCAyMDIyLTExLTI5IGF0IDA5OjM4ICswODAwLCB3ZWl3ZWkgd3JvdGU6DQo+IA0KPiBP
biAyMDIyLzExLzI5IDA3OjA2LCBXaWxmcmVkIE1hbGxhd2Egd3JvdGU6DQo+IMKgDQo+ID4gT24g
TW9uLCAyMDIyLTExLTI4IGF0IDIwOjI5ICswODAwLCBXZWl3ZWkgTGkgd3JvdGU6DQo+ID4gwqAN
Cj4gPiA+IE1vZGlmeSB0aGUgY2hlY2sgZm9yIEMgZXh0ZW5zaW9uIHRvIFpjYSAoQyBpbXBsaWVz
IFpjYSkNCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogV2Vpd2VpIExpIDxsaXdlaXdlaUBp
c2Nhcy5hYy5jbj4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEp1bnFpYW5nIFdhbmcgPHdhbmdqdW5x
aWFuZ0Bpc2Nhcy5hYy5jbj4NCj4gPiA+IFJldmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8
cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gPiA+IFJldmlld2VkLWJ5OiBBbGlzdGFp
ciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKg
dGFyZ2V0L3Jpc2N2L2luc25fdHJhbnMvdHJhbnNfcnZpLmMuaW5jIHwgNCArKy0tDQo+ID4gPiDC
oHRhcmdldC9yaXNjdi90cmFuc2xhdGUuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDggKysrKysrLS0NCj4gPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3YvaW5z
bl90cmFucy90cmFuc19ydmkuYy5pbmMNCj4gPiA+IGIvdGFyZ2V0L3Jpc2N2L2luc25fdHJhbnMv
dHJhbnNfcnZpLmMuaW5jDQo+ID4gPiBpbmRleCA0NDk2ZjIxMjY2Li5lZjdjMzAwMmIwIDEwMDY0
NA0KPiA+ID4gLS0tIGEvdGFyZ2V0L3Jpc2N2L2luc25fdHJhbnMvdHJhbnNfcnZpLmMuaW5jDQo+
ID4gPiArKysgYi90YXJnZXQvcmlzY3YvaW5zbl90cmFucy90cmFuc19ydmkuYy5pbmMNCj4gPiA+
IEBAIC01Niw3ICs1Niw3IEBAIHN0YXRpYyBib29sIHRyYW5zX2phbHIoRGlzYXNDb250ZXh0ICpj
dHgsDQo+ID4gPiBhcmdfamFscg0KPiA+ID4gKmEpDQo+ID4gPiDCoMKgwqDCoCB0Y2dfZ2VuX2Fu
ZGlfdGwoY3B1X3BjLCBjcHVfcGMsICh0YXJnZXRfdWxvbmcpLTIpOw0KPiA+ID4gwqANCj4gPiA+
IMKgwqDCoMKgIGdlbl9zZXRfcGMoY3R4LCBjcHVfcGMpOw0KPiA+ID4gLcKgwqDCoCBpZiAoIWhh
c19leHQoY3R4LCBSVkMpKSB7DQo+ID4gPiArwqDCoMKgIGlmICghY3R4LT5jZmdfcHRyLT5leHRf
emNhKSB7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgIFRDR3YgdDAgPSB0Y2dfdGVtcF9uZXcoKTsN
Cj4gPiA+IMKgDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgIG1pc2FsaWduZWQgPSBnZW5fbmV3X2xh
YmVsKCk7DQo+ID4gPiBAQCAtMTc4LDcgKzE3OCw3IEBAIHN0YXRpYyBib29sIGdlbl9icmFuY2go
RGlzYXNDb250ZXh0ICpjdHgsDQo+ID4gPiBhcmdfYg0KPiA+ID4gKmEsIFRDR0NvbmQgY29uZCkN
Cj4gPiA+IMKgDQo+ID4gPiDCoMKgwqDCoCBnZW5fc2V0X2xhYmVsKGwpOyAvKiBicmFuY2ggdGFr
ZW4gKi8NCj4gPiA+IMKgDQo+ID4gPiAtwqDCoMKgIGlmICghaGFzX2V4dChjdHgsIFJWQykgJiYg
KChjdHgtPmJhc2UucGNfbmV4dCArIGEtPmltbSkgJg0KPiA+ID4gMHgzKSkNCj4gPiA+IHsNCj4g
PiA+ICvCoMKgwqAgaWYgKCFjdHgtPmNmZ19wdHItPmV4dF96Y2EgJiYgKChjdHgtPmJhc2UucGNf
bmV4dCArIGEtPmltbSkNCj4gPiA+ICYNCj4gPiA+IDB4MykpIHsNCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqAgLyogbWlzYWxpZ25lZCAqLw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCBnZW5fZXhjZXB0
aW9uX2luc3RfYWRkcl9taXMoY3R4KTsNCj4gPiA+IMKgwqDCoMKgIH0gZWxzZSB7DQo+ID4gPiBk
aWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L3RyYW5zbGF0ZS5jIGIvdGFyZ2V0L3Jpc2N2L3RyYW5z
bGF0ZS5jDQo+ID4gPiBpbmRleCAyYWI4NzcyZWJlLi5lZTI0YjQ1MWUzIDEwMDY0NA0KPiA+ID4g
LS0tIGEvdGFyZ2V0L3Jpc2N2L3RyYW5zbGF0ZS5jDQo+ID4gPiArKysgYi90YXJnZXQvcmlzY3Yv
dHJhbnNsYXRlLmMNCj4gPiA+IEBAIC01NTcsNyArNTU3LDcgQEAgc3RhdGljIHZvaWQgZ2VuX2ph
bChEaXNhc0NvbnRleHQgKmN0eCwgaW50DQo+ID4gPiByZCwNCj4gPiA+IHRhcmdldF91bG9uZyBp
bW0pDQo+ID4gPiDCoA0KPiA+ID4gwqDCoMKgwqAgLyogY2hlY2sgbWlzYWxpZ25lZDogKi8NCj4g
PiA+IMKgwqDCoMKgIG5leHRfcGMgPSBjdHgtPmJhc2UucGNfbmV4dCArIGltbTsNCj4gPiA+IC3C
oMKgwqAgaWYgKCFoYXNfZXh0KGN0eCwgUlZDKSkgew0KPiA+ID4gK8KgwqDCoCBpZiAoIWN0eC0+
Y2ZnX3B0ci0+ZXh0X3pjYSkgew0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoKG5leHRfcGMg
JiAweDMpICE9IDApIHsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnZW5fZXhjZXB0
aW9uX2luc3RfYWRkcl9taXMoY3R4KTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm47DQo+ID4gPiBAQCAtMTA5Nyw3ICsxMDk3LDExIEBAIHN0YXRpYyB2b2lkIGRlY29kZV9v
cGMoQ1BVUklTQ1ZTdGF0ZSAqZW52LA0KPiA+ID4gRGlzYXNDb250ZXh0ICpjdHgsIHVpbnQxNl90
IG9wY29kZSkNCj4gPiA+IMKgwqDCoMKgIGN0eC0+dmlydF9pbnN0X2V4Y3AgPSBmYWxzZTsNCj4g
PiA+IMKgwqDCoMKgIC8qIENoZWNrIGZvciBjb21wcmVzc2VkIGluc24gKi8NCj4gPiA+IMKgwqDC
oMKgIGlmIChpbnNuX2xlbihvcGNvZGUpID09IDIpIHsNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoCBp
ZiAoIWhhc19leHQoY3R4LCBSVkMpKSB7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqAgLyoNCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgICogWmNhIHN1cHBvcnQgYWxsIG9mIHRoZSBleGlzdGluZyBDIGV4
dGVuc2lvbiwNCj4gPiA+IGV4Y2x1ZGluZw0KPiA+ID4gYWxsDQo+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoCAqIGNvbXByZXNzZWQgZmxvYXRpbmcgcG9pbnQgbG9hZHMgYW5kIHN0b3Jlcw0KPiA+ID4g
K8KgwqDCoMKgwqDCoMKgwqAgKi8NCj4gPiBMb29rIGxpa2UgYSB0eXBvOiAqYHN1cHBvcnRzYCBh
bmQgKmBDIGV4dGVuc2lvbnNgDQo+IFRoYW5rcyBhIGxvdCHCoCANCj4gWWVhaCzCoCBpdCBzaG91
bGQgYmUgJ3N1cHBvcnRzJyBoZXJlIChhbmQgaXQncyAnaXMnIGhlcmUgaW4gb3JpZ2luYWwNCj4g
WmMqIDAuNzAuMSBzcGVjKS4gDQo+IE1heWJlIHdlIGNhbiB1c2UgdGhlIG5ldyBkZXNjcmlwdGlv
biBmcm9tIG5ld2VzdCBzcGVjIGhlcmU6DQo+ICJUaGUgWmNhIGV4dGVuc2lvbiBpcyBhZGRlZCBh
cyB3YXkgdG8gcmVmZXIgdG8gaW5zdHJ1Y3Rpb25zIGluIHRoZSBDDQo+IGV4dGVuc2lvbiB0aGF0
IGRvIG5vdCBpDQo+IG5jbHVkZSB0aGUgZmxvYXRpbmctcG9pbnQgbG9hZHMgYW5kIHN0b3Jlcy4i
DQpZZWEsIHRoYXQgc291bmRzIGdvb2QhDQo+IEJ5IHRoZSB3YXksIHdoeSBkbyB5b3UgdGhpbmsg
aXQgc2hvdWxkIGJlICdDIGV4dGVuc2lvbnMnID8NCkFoIGNyYXAsIHNvcnJ5ISBJIG1pc3JlYWQg
aXQsIGl0IGxvb2tzIGNvcnJlY3QuDQoNClJlZ2FyZHMsDQpXaWxmcmVkDQoNCj4gUmVnYXJkcywN
Cj4gV2Vpd2VpIExpDQo+IMKgDQo+ID4gwqDCoA0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgIGlmICgh
Y3R4LT5jZmdfcHRyLT5leHRfemNhKSB7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Z2VuX2V4Y2VwdGlvbl9pbGxlZ2FsKGN0eCk7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgIH0gZWxz
ZSB7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3R4LT5vcGNvZGUgPSBvcGNvZGU7
DQo+ID4gb3RoZXJ3aXNlLA0KPiA+IFJldmlld2VkLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZy
ZWQubWFsbGF3YUB3ZGMuY29tPg0KPiA+IA0KPiA+IFdpbGZyZWQNCj4gwqANCg0K

