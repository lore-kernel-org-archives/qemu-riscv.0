Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozku9-0003V5-7O
	for mharc-qemu-riscv@gnu.org; Mon, 28 Nov 2022 15:39:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1ozku6-0003Si-St; Mon, 28 Nov 2022 15:39:03 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1ozku4-0004F9-7p; Mon, 28 Nov 2022 15:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1669667939; x=1701203939;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+SegP+DE3Dkw4AKCU7onIRTIlMebTVCTIaj3V1cEeWA=;
 b=W8UJ7GC3SzLcS6yZwaVgwRdhR9fSoU8q2TcdhETJG53uvBVG+LdDIpXG
 xcuBQIpXwUVeEbiwOdEg0kkA37IWO75SnpfKEm1tPbBWheqo4bGUzzoNE
 aRDvWCB61oknOXO25KqqBjuA/pVBWa3MjHaCfEFfgR+Eak0tR2jdQ8uXK
 8LjWCAk++PZUKFrOEJEsfki1J3gTX2TCujtPSx48twJGxZddnD/iZll2p
 ZyN6ZcrsROzr2P7vzJYeCJTytAIJ7H9QWzblXnCS/MEZKKizjZJ6jKisX
 WKtWe3Xqj1MGDgmb/ng1cTuAPo/yWphgb5c9ppMY9YltLAIwKAkwPTzZD g==;
X-IronPort-AV: E=Sophos;i="5.96,201,1665471600"; d="scan'208";a="190889364"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Nov 2022 13:38:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 28 Nov 2022 13:38:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 28 Nov 2022 13:38:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBj7mcCqQ+pr9Mmv3UymKdJxLIFn6Oj7odlujgF/t8b4lcqgxXlaZggLdenZlIcyQQWkivU3LdDjoM0fFuMzFo2h1UeCsSoeuuS3rG2I3ObeSwS2BDSIU34ggA7Y9v9XInJTzaofOyQ5Mq3EFWWIYGgPb+qkgFXDODh9RPVJ3GlzaGjW1Oiu/xWIH7q5O0whx2IckLjDAw5yqyRGkoN3kyZ5Ulauv8Eot0Bo6/ZqduHmNbGOq7vypYWSzBFdcVq070idIRcXM73XnarsNJeCX0Aeu5Vc87kOV549rRiBmfT5XWvw4NI51BGWhmiSMhTOs0Wwb0jvUP6NFFL5ZuwNPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SegP+DE3Dkw4AKCU7onIRTIlMebTVCTIaj3V1cEeWA=;
 b=Z8xdOpFPGSWs8N/QokluBKypvXUtM8GSuNoiOVJGKbYeBUFoqX+5H4SuISqiH/ES3+MlUm4Tfc+pED2iTsxENnnnbA9nWfKBUbdWV6hHTdGhCRKXpfYdB6pHupO5zGtzr/LA9QVTiueoAe4mHU0NdZLbpM072eo3maOm3eZmzmTDE6sh9U0G7AqRrpBW8Q4gKLycrvBmTU7NmcxWWNGGXagx7BceBWZX6NnsmH0+8pfA6fmB7x141lX2DQ446gidbVjbW5XWq8JgvYmtphzAa0rbCf4zxUFSVjeUB0AqOgavkAVRFDR/NQ/WyiyCN1tv44v2lH5HmPXgZzpY1VgLuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SegP+DE3Dkw4AKCU7onIRTIlMebTVCTIaj3V1cEeWA=;
 b=pWaP4kCuBcIaEF8iBUuHAMQm21Y3Yj9ARLO6On8GrfrN0k8B4d4M5/OYMPek7jWQc4ElFCNI19Okf3oQPvsYXnlQcPa9K5Y2or09tnMVsWNbf8hK8Tq0IJFBgRKsS/+KkBE85B1FnwXI+JOgYxcj6vhGhYl4C0bx534Sq3F3XrA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY8PR11MB7289.namprd11.prod.outlook.com (2603:10b6:930:99::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Mon, 28 Nov
 2022 20:38:44 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6%5]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 20:38:44 +0000
From: <Conor.Dooley@microchip.com>
To: <atishp@rivosinc.com>, <Conor.Dooley@microchip.com>
CC: <qemu-devel@nongnu.org>, <alistair.francis@wdc.com>,
 <bin.meng@windriver.com>, <palmer@dabbelt.com>, <qemu-riscv@nongnu.org>
Subject: Re: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device tree
Thread-Topic: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device
 tree
Thread-Index: AQHZA2ZrKWGujbHaTkmukQtrcQh1RK5UzAKA
Date: Mon, 28 Nov 2022 20:38:44 +0000
Message-ID: <a3c7174d-6d33-5a34-0cd5-8ac340c052c3@microchip.com>
References: <20220824221701.41932-1-atishp@rivosinc.com>
 <20220824221701.41932-5-atishp@rivosinc.com> <Y39urpX82uO85AAb@wendy>
 <CAHBxVyFhrkdhWpc4xB-_a4c5GnDu=d01-bk2zM2nCraeq_Xr_A@mail.gmail.com>
In-Reply-To: <CAHBxVyFhrkdhWpc4xB-_a4c5GnDu=d01-bk2zM2nCraeq_Xr_A@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|CY8PR11MB7289:EE_
x-ms-office365-filtering-correlation-id: d17ff966-45d8-49f9-d02e-08dad1808ade
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N47Cq0kDCWu8u0u6225XoN7XMSFqjkew458BzrsvntoP4woHz+hVGp+gqXT0YwsG7TWEDvXPELOb+bqt2f5vkEiX991MbJ4DK1BkdPq3wBwpAHOEfQwDfjmewUEfF73/kFDP8DAlhrP1XLFrYRnCMmw5Skg6imfyScgF+sGRT5mR0+cuNGRDC5SKHGJgRurRvRzTRsjkgw3pXPCoRnUh0ElgRrlyHCuidAlHPuBi3n0+rzXqnjWVB8DEMR3B9omh36F1USGI5voVSftdQbSEPwJuRfhlqld0px91Wk+myfgHVBjrI0yEOCn2MgRF7RONA7CtSMUhQJGQ4FlnruounXoatuCFMnM2Ll6G30CQx0SEzwMfLt8FNB+XliXjLR7SYIBaBXHs3kFiHK5wq0yRAxHTPiuppZGC1yNTdc4C9SPJV87JozMFAgZXSwjM4jiQUkHjQPa0KOcY+zqsjyVWo177I/c6xjG1owBxKPQ3LF4NnBR+ZwqSJlj3B+36k9m1WgsXLGu2hUVdBx9eNAt7ObGjevaLNbGU00UR+Def0bNeweAM8n+ZR1tEfHLjBnFI850fyjBJHHsMOHjs/K/s3Z6E69ZZZVsFOfrdlXaptuIoncp7+tfl57meUW9Q/S62RgOBrN1v7jZbK31lb+SY2A/eZVHwauFRuwyn6/Yi69sBeqTJMRerfHsYP3/zqXAH9H92YuLzw3QUchX8g+VUGlZazqFYrbaESNkcRRUc7KuTLHijlgrXxsxrlIE33I7IY7/g61lFCf64U/aFFTRN9g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(39860400002)(346002)(366004)(396003)(451199015)(83380400001)(2616005)(5660300002)(186003)(38070700005)(38100700002)(2906002)(122000001)(8936002)(478600001)(76116006)(6486002)(6506007)(66446008)(31686004)(71200400001)(66946007)(6512007)(66556008)(41300700001)(53546011)(4326008)(64756008)(66476007)(26005)(91956017)(110136005)(316002)(54906003)(8676002)(36756003)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bG1BaDZocStSTkMrd21jUFowNWgzbXRraDF2NUxJamY3VFNuOEtDK1VDY0tw?=
 =?utf-8?B?REk3ZXdEWlRWSmk1MUNpSGxrZi93cDh5N1RiTDNHVTFhOEMvaFdRRVQrOTFM?=
 =?utf-8?B?MUZzNFB6ZndJQlNsTkpZSmJmd3BhbzVLMENwMlF2WFZHQ2hRRWFCbWgxY0xn?=
 =?utf-8?B?VU9Gc0ZhWXZSUEF3dlJLby9pb3llSGlWMUVveHVIRHM1aDYzVnB2YStWTEg3?=
 =?utf-8?B?ZFhQN3ZXdVVsOVJla2VOOFFDaHJxeGRudmNuYm5vTzlWYWFNdnBLL25yeXNs?=
 =?utf-8?B?STlER29JZEhkbDlNUTRxS2lBZE85MTB5bWlWQ21kL213ZitYMjEyYVRJUDUy?=
 =?utf-8?B?bmN2VU1xR3ZuWTJLQzRoV2dyZHNMTFJITldaaDZ5a0hTajlGVjcyNWgyVDZ4?=
 =?utf-8?B?bzd1dkRjVXhEYXpCT3BvdzR0dmtsa3AzNGlEK2o1RmJiYlhQQzgzOUZSTHV6?=
 =?utf-8?B?QjhEV2luaERlZGZCNVdsakdMMGJWWGFhTHc3Uzk4bFdCZ0NLbllURnA1bVFP?=
 =?utf-8?B?Ym9JNWgvaTUvRFltOWFYcEg1anJZaFBYOEludm1PQWx3ZkRMN0djZXE2b3FT?=
 =?utf-8?B?SUxLZ25PbmsrZkxFTG1YY25XcG9UamdhWjVJQW8zSWhXYmloTC9pcGVlU2dY?=
 =?utf-8?B?TEZha1BCQVlzTktaZ09GUlIraDZOdGIzOU5MbUEwK2I3cDQxNnU0Rm5NZ3ZK?=
 =?utf-8?B?czZBWUJqZ2tLeHpxOFZVV2J3ZmpiOFJEMkVWeldaS0k1dXdMdTlFSllpcG5S?=
 =?utf-8?B?SWowVTVGNS9lYkpUWG9FVnR4VHBYRGZGT3ZWRkZvUDNFWTFrTHVyaEtUa1RO?=
 =?utf-8?B?cjliaVBoaUpRTkhXTzd0YW5GNzJHREJnYnpFWjF5LzcxSHlSNDFBL0tmUXdJ?=
 =?utf-8?B?VUF3cDQvdlo1V2JJaDg3Sm5JeE5NMXhRZWlMcm9ldk1xdUZpaFNqdWI2K05H?=
 =?utf-8?B?RzRNOVByQjdtbzNIelZ1L05rbjFzSTEwYSsyM2Z0Rk1MTFdsOERMY0NmWjAw?=
 =?utf-8?B?VEJMa1ZwWVlFWkt1Q1UrU1F5N2tWLy82YmtFcDFsdU5hTjlCTGkwdnFaK01y?=
 =?utf-8?B?YWlhM1NvWkJHZkZFQWVob0hoYUpYK2x6S1NNTzFKM2Q2RVJOdHE5bEhKYUJF?=
 =?utf-8?B?bnNJendnSGEvMnc0bFlNdHN6eC82TTh2RitZbTg2TVVLbkRENmtnNDl5MXBs?=
 =?utf-8?B?ajU0ODdMN3QyVVNiM3JCdTk2UHl1YTNzV0ErNExrNjcrb214dUYzOXZhRzVp?=
 =?utf-8?B?US9vUDlVWUZZSWVTUWNLQVdJM3ZIN2NYdlUxTFNYbDdibWtxSHFkU3JnN2xD?=
 =?utf-8?B?QnNsUlI0cDAyN3FjdE1rdFd2UVJMdjcrTmRJQ1pQN09Xc3lIcC9ZYmtGNnFJ?=
 =?utf-8?B?bmR1Q2NYK0huSktVKzhTeTJ4UGt2aGo0NFB0SjVQbjZ6ZEovaFRuci9SQ2Fp?=
 =?utf-8?B?TXhQSldYQmFtU3IzZnRlV0F6OHozV1FSNnoyc2xyS1MzODdpZThyOXBRVGhI?=
 =?utf-8?B?VGFlKytkbUZOaVhaVUQra3ZGSGJyWjNlQ2c4aVBjbkgxb2JqTjkwaWRYSmFw?=
 =?utf-8?B?L3BQNGVWU2pKQmtablhER0I1anZkaFZkdVQzYytVbVM4TzFhU1JISFRxQ01q?=
 =?utf-8?B?Ujg3ZG5IOXRYUGthcnF3VEhmdElQdG0rck1INlUxcXJ6YVMybzkxQkZrcWJi?=
 =?utf-8?B?QzUveFRWU3psQ0QrWUNXNk4ySlZTSTUzM2tEd3NST0xnUW9mL05kWkowaWx5?=
 =?utf-8?B?c0g2c3JDSUtmWWtjdWVJUmxKQ01kVjNHTThuNXhuVWpTVzg5bVFOWHlSNlZJ?=
 =?utf-8?B?V2R3TTVNejZGc2xJbTN2bEtJWEZrak1Gd2w0SXEvWk9EMk9DQXFhTElkdGtz?=
 =?utf-8?B?ZzBmdytUT1RzRENnWGFCNVllNVpLZ25EaVhiM1MwbnNva1h3YndZazVnOEJR?=
 =?utf-8?B?ZHB6SmlQMU5XWGtZMTkrT0l1c1BJVDJTTkFKT3lWOUxkZ2E2UE9Fbmw5UWtS?=
 =?utf-8?B?S1RKcEx3Wmg1aHhUdGUwM0YxQTlXL2kzTE5CYXlTRUMwcWRLamZKb01Va0JV?=
 =?utf-8?B?OXNXK1FoZnNsc0JFMGM3eUFJQUg3WFVtMUlVcW11Mnp0QVlQSGpya2xrV29F?=
 =?utf-8?B?VVB1K1RmenZkbXMxTDdvRDFJVHNxN2RKUEwyLzgvaDJHSWUvMEo1ZDBBK1VM?=
 =?utf-8?B?R0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <436F91D63B8A5644A5AC909920A7B76A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17ff966-45d8-49f9-d02e-08dad1808ade
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2022 20:38:44.2066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sonmub+++uU4XtpRQe6+KDcSVU6WXA29kwbK5pBAYlOrar3oc0oJqj8Vpfb5440LSfe9sxXBwkkRc3/JOPLAs3u660qHH8mo7YnVtqgRY3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7289
Received-SPF: pass client-ip=68.232.153.233;
 envelope-from=Conor.Dooley@microchip.com; helo=esa.microchip.iphmx.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 28 Nov 2022 20:39:04 -0000

T24gMjgvMTEvMjAyMiAyMDoxNiwgQXRpc2ggS3VtYXIgUGF0cmEgd3JvdGU6DQo+IE9uIFRodSwg
Tm92IDI0LCAyMDIyIGF0IDU6MTcgQU0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9j
aGlwLmNvbT4gd3JvdGU6DQo+Pg0KPj4gT24gV2VkLCBBdWcgMjQsIDIwMjIgYXQgMDM6MTc6MDBQ
TSAtMDcwMCwgQXRpc2ggUGF0cmEgd3JvdGU6DQo+Pj4gUWVtdSB2aXJ0IG1hY2hpbmUgY2FuIHN1
cHBvcnQgZmV3IGNhY2hlIGV2ZW50cyBhbmQgY3ljbGUvaW5zdHJldCBjb3VudGVycy4NCj4+PiBJ
dCBhbHNvIHN1cHBvcnRzIGNvdW50ZXIgb3ZlcmZsb3cgZm9yIHRoZXNlIGV2ZW50cy4NCj4+Pg0K
Pj4+IEFkZCBhIERUIG5vZGUgc28gdGhhdCBPcGVuU0JJL0xpbnV4IGtlcm5lbCBpcyBhd2FyZSBv
ZiB0aGUgdmlydCBtYWNoaW5lDQo+Pj4gY2FwYWJpbGl0aWVzLiBUaGVyZSBhcmUgc29tZSBkdW1t
eSBub2RlcyBhZGRlZCBmb3IgdGVzdGluZyBhcyB3ZWxsLg0KPj4NCj4+IEhleSBBdGlzaCENCj4+
DQo+PiBJIHdhcyBmaWRkbGluZyB3aXRoIGR1bXBpbmcgdGhlIHZpcnQgbWFjaGluZSBkdGIgYWdh
aW4gdG9kYXkgdG8gY2hlY2sNCj4+IHNvbWUgZHQtYmluZGluZyBjaGFuZ2VzIEkgd2FzIG1ha2lu
ZyBmb3IgdGhlIGlzYSBzdHJpbmcgd291bGQgcGxheQ0KPj4gbmljZWx5IHdpdGggdGhlIHZpcnQg
bWFjaGluZSAmIEkgbm90aWNlZCB0aGF0IHRoaXMgcGF0Y2ggaGFzIGludHJvZHVjZWQNCj4+IGEg
bmV3IHZhbGlkYXRpb24gZmFpbHVyZToNCj4+DQo+PiAuL2J1aWxkL3FlbXUtc3lzdGVtLXJpc2N2
NjQgLW5vZ3JhcGhpYyAtbWFjaGluZSB2aXJ0LGR1bXBkdGI9cWVtdS5kdGINCj4+DQo+PiBkdC12
YWxpZGF0ZSAtcCAuLi9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHJv
Y2Vzc2VkLXNjaGVtYS5qc29uIHFlbXUuZHRiDQo+PiAvaG9tZS9jb25vci9zdHVmZi9xZW11L3Fl
bXUuZHRiOiBzb2M6IHBtdTogeydyaXNjdixldmVudC10by1taHBtY291bnRlcnMnOiBbWzEsIDEs
IDUyNDI4MSwgMiwgMiwgNTI0Mjg0LCA2NTU2MSwgNjU1NjEsIDUyNDI4MCwgNjU1NjMsIDY1NTYz
LCA1MjQyODAsIDY1NTY5LCA2NTU2OSwgNTI0MjgwLCAwLCAwLCAwLCAwLCAwXV0sICdjb21wYXRp
YmxlJzogWydyaXNjdixwbXUnXX0gc2hvdWxkIG5vdCBiZSB2YWxpZCB1bmRlciB7J3R5cGUnOiAn
b2JqZWN0J30NCj4+ICAgICAgICAgRnJvbSBzY2hlbWE6IC9ob21lL2Nvbm9yLy5sb2NhbC9saWIv
cHl0aG9uMy4xMC9zaXRlLXBhY2thZ2VzL2R0c2NoZW1hL3NjaGVtYXMvc2ltcGxlLWJ1cy55YW1s
DQo+Pg0KPj4gSSBhc3N1bWUgdGhpcyBpcyB0aGUgYWZvcmVtZW50aW9uZWQgImR1bW15IiBub2Rl
ICYgeW91IGhhdmUgbm8gaW50ZW50aW9uDQo+PiBvZiBjcmVhdGluZyBhIGJpbmRpbmcgZm9yIHRo
aXM/DQo+Pg0KPiANCj4gSXQgaXMgYSBkdW1teSBub2RlIGZyb20gTGludXgga2VybmVsIHBlcnNw
ZWN0aXZlLiBPcGVuU2JpIHVzZSB0aGlzDQo+IG5vZGUgdG8gZmlndXJlIG91dCB0aGUgaHBtY291
bnRlciBtYXBwaW5ncy4NCg0KQXllLCBidXQgc2hvdWxkIGl0IG5vdCBoYXZlIGEgYmluZGluZyBh
bnl3YXksIHNpbmNlIHRoZXkncmUgbm90DQptZWFudCB0byBiZSBsaW51eCBzcGVjaWZpYz8NCg0K
Pj4+IEFja2VkLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+
DQo+Pj4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5jb20+DQo+
Pj4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+DQo+Pj4g
LS0tDQo+Pj4gIGh3L3Jpc2N2L3ZpcnQuYyAgICB8IDE2ICsrKysrKysrKysrKysNCj4+PiAgdGFy
Z2V0L3Jpc2N2L3BtdS5jIHwgNTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPj4+ICB0YXJnZXQvcmlzY3YvcG11LmggfCAgMSArDQo+Pj4gIDMgZmlsZXMg
Y2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2h3L3Jpc2N2
L3ZpcnQuYyBiL2h3L3Jpc2N2L3ZpcnQuYw0KPj4+IGluZGV4IGZmOGMwZGY1Y2Q0Ny4uYmVmYTlk
MmMyNmFjIDEwMDY0NA0KPj4+IC0tLSBhL2h3L3Jpc2N2L3ZpcnQuYw0KPj4+ICsrKyBiL2h3L3Jp
c2N2L3ZpcnQuYw0KPj4+IEBAIC0zMCw2ICszMCw3IEBADQo+Pj4gICNpbmNsdWRlICJody9jaGFy
L3NlcmlhbC5oIg0KPj4+ICAjaW5jbHVkZSAidGFyZ2V0L3Jpc2N2L2NwdS5oIg0KPj4+ICAjaW5j
bHVkZSAiaHcvY29yZS9zeXNidXMtZmR0LmgiDQo+Pj4gKyNpbmNsdWRlICJ0YXJnZXQvcmlzY3Yv
cG11LmgiDQo+Pj4gICNpbmNsdWRlICJody9yaXNjdi9yaXNjdl9oYXJ0LmgiDQo+Pj4gICNpbmNs
dWRlICJody9yaXNjdi92aXJ0LmgiDQo+Pj4gICNpbmNsdWRlICJody9yaXNjdi9ib290LmgiDQo+
Pj4gQEAgLTcwOCw2ICs3MDksMjAgQEAgc3RhdGljIHZvaWQgY3JlYXRlX2ZkdF9zb2NrZXRfYXBs
aWMoUklTQ1ZWaXJ0U3RhdGUgKnMsDQo+Pj4gICAgICBhcGxpY19waGFuZGxlc1tzb2NrZXRdID0g
YXBsaWNfc19waGFuZGxlOw0KPj4+ICB9DQo+Pj4NCj4+PiArc3RhdGljIHZvaWQgY3JlYXRlX2Zk
dF9wbXUoUklTQ1ZWaXJ0U3RhdGUgKnMpDQo+Pj4gK3sNCj4+PiArICAgIGNoYXIgKnBtdV9uYW1l
Ow0KPj4+ICsgICAgTWFjaGluZVN0YXRlICptYyA9IE1BQ0hJTkUocyk7DQo+Pj4gKyAgICBSSVND
VkNQVSBoYXJ0ID0gcy0+c29jWzBdLmhhcnRzWzBdOw0KPj4+ICsNCj4+PiArICAgIHBtdV9uYW1l
ID0gZ19zdHJkdXBfcHJpbnRmKCIvc29jL3BtdSIpOw0KPj4+ICsgICAgcWVtdV9mZHRfYWRkX3N1
Ym5vZGUobWMtPmZkdCwgcG11X25hbWUpOw0KPj4+ICsgICAgcWVtdV9mZHRfc2V0cHJvcF9zdHJp
bmcobWMtPmZkdCwgcG11X25hbWUsICJjb21wYXRpYmxlIiwgInJpc2N2LHBtdSIpOw0KPj4+ICsg
ICAgcmlzY3ZfcG11X2dlbmVyYXRlX2ZkdF9ub2RlKG1jLT5mZHQsIGhhcnQuY2ZnLnBtdV9udW0s
IHBtdV9uYW1lKTsNCj4+PiArDQo+Pj4gKyAgICBnX2ZyZWUocG11X25hbWUpOw0KPj4+ICt9DQo+
Pj4gKw0KPj4+ICBzdGF0aWMgdm9pZCBjcmVhdGVfZmR0X3NvY2tldHMoUklTQ1ZWaXJ0U3RhdGUg
KnMsIGNvbnN0IE1lbU1hcEVudHJ5ICptZW1tYXAsDQo+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBib29sIGlzXzMyX2JpdCwgdWludDMyX3QgKnBoYW5kbGUsDQo+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCAqaXJxX21taW9fcGhhbmRsZSwNCj4+
PiBAQCAtMTAzNiw2ICsxMDUxLDcgQEAgc3RhdGljIHZvaWQgY3JlYXRlX2ZkdChSSVNDVlZpcnRT
dGF0ZSAqcywgY29uc3QgTWVtTWFwRW50cnkgKm1lbW1hcCwNCj4+Pg0KPj4+ICAgICAgY3JlYXRl
X2ZkdF9mbGFzaChzLCBtZW1tYXApOw0KPj4+ICAgICAgY3JlYXRlX2ZkdF9md19jZmcocywgbWVt
bWFwKTsNCj4+PiArICAgIGNyZWF0ZV9mZHRfcG11KHMpOw0KPj4+DQo+Pj4gIHVwZGF0ZV9ib290
YXJnczoNCj4+PiAgICAgIGlmIChjbWRsaW5lICYmICpjbWRsaW5lKSB7DQo+Pj4gZGlmZiAtLWdp
dCBhL3RhcmdldC9yaXNjdi9wbXUuYyBiL3RhcmdldC9yaXNjdi9wbXUuYw0KPj4+IGluZGV4IGE1
ZjUwNGU1M2M4OC4uYjhlNTZkMmI3YjhlIDEwMDY0NA0KPj4+IC0tLSBhL3RhcmdldC9yaXNjdi9w
bXUuYw0KPj4+ICsrKyBiL3RhcmdldC9yaXNjdi9wbXUuYw0KPj4+IEBAIC0yMCwxMSArMjAsNjgg
QEANCj4+PiAgI2luY2x1ZGUgImNwdS5oIg0KPj4+ICAjaW5jbHVkZSAicG11LmgiDQo+Pj4gICNp
bmNsdWRlICJzeXNlbXUvY3B1LXRpbWVycy5oIg0KPj4+ICsjaW5jbHVkZSAic3lzZW11L2Rldmlj
ZV90cmVlLmgiDQo+Pj4NCj4+PiAgI2RlZmluZSBSSVNDVl9USU1FQkFTRV9GUkVRIDEwMDAwMDAw
MDAgLyogMUdoeiAqLw0KPj4+ICAjZGVmaW5lIE1BS0VfMzJCSVRfTUFTSyhzaGlmdCwgbGVuZ3Ro
KSBcDQo+Pj4gICAgICAgICAgKCgodWludDMyX3QpKH4wVUwpID4+ICgzMiAtIChsZW5ndGgpKSkg
PDwgKHNoaWZ0KSkNCj4+Pg0KPj4+ICsvKg0KPj4+ICsgKiBUbyBrZWVwIGl0IHNpbXBsZSwgYW55
IGV2ZW50IGNhbiBiZSBtYXBwZWQgdG8gYW55IHByb2dyYW1tYWJsZSBjb3VudGVycyBpbg0KPj4+
ICsgKiBRRU1VLiBUaGUgZ2VuZXJpYyBjeWNsZSAmIGluc3RydWN0aW9uIGNvdW50IGV2ZW50cyBj
YW4gYWxzbyBiZSBtb25pdG9yZWQNCj4+PiArICogdXNpbmcgcHJvZ3JhbW1hYmxlIGNvdW50ZXJz
LiBJbiB0aGF0IGNhc2UsIG1jeWNsZSAmIG1pbnN0cmV0IG11c3QgY29udGludWUNCj4+PiArICog
dG8gcHJvdmlkZSB0aGUgY29ycmVjdCB2YWx1ZSBhcyB3ZWxsLiBIZXRlcm9nZW5lb3VzIFBNVSBw
ZXIgaGFydCBpcyBub3QNCj4+PiArICogc3VwcG9ydGVkIHlldC4gVGh1cywgbnVtYmVyIG9mIGNv
dW50ZXJzIGFyZSBzYW1lIGFjcm9zcyBhbGwgaGFydHMuDQo+Pj4gKyAqLw0KPj4+ICt2b2lkIHJp
c2N2X3BtdV9nZW5lcmF0ZV9mZHRfbm9kZSh2b2lkICpmZHQsIGludCBudW1fY3RycywgY2hhciAq
cG11X25hbWUpDQo+Pj4gK3sNCj4+PiArICAgIHVpbnQzMl90IGZkdF9ldmVudF9jdHJfbWFwWzIw
XSA9IHt9Ow0KPj4+ICsgICAgdWludDMyX3QgY21hc2s7DQo+Pj4gKw0KPj4+ICsgICAgLyogQWxs
IHRoZSBwcm9ncmFtbWFibGUgY291bnRlcnMgY2FuIG1hcCB0byBhbnkgZXZlbnQgKi8NCj4+PiAr
ICAgIGNtYXNrID0gTUFLRV8zMkJJVF9NQVNLKDMsIG51bV9jdHJzKTsNCj4+PiArDQo+Pj4gKyAg
IC8qDQo+Pj4gKyAgICAqIFRoZSBldmVudCBlbmNvZGluZyBpcyBzcGVjaWZpZWQgaW4gdGhlIFNC
SSBzcGVjaWZpY2F0aW9uDQo+Pj4gKyAgICAqIEV2ZW50IGlkeCBpcyBhIDIwYml0cyB3aWRlIG51
bWJlciBlbmNvZGVkIGFzIGZvbGxvd3M6DQo+Pj4gKyAgICAqIGV2ZW50X2lkeFsxOToxNl0gPSB0
eXBlDQo+Pj4gKyAgICAqIGV2ZW50X2lkeFsxNTowXSA9IGNvZGUNCj4+PiArICAgICogVGhlIGNv
ZGUgZmllbGQgaW4gY2FjaGUgZXZlbnRzIGFyZSBlbmNvZGVkIGFzIGZvbGxvd3M6DQo+Pj4gKyAg
ICAqIGV2ZW50X2lkeC5jb2RlWzE1OjNdID0gY2FjaGVfaWQNCj4+PiArICAgICogZXZlbnRfaWR4
LmNvZGVbMjoxXSA9IG9wX2lkDQo+Pj4gKyAgICAqIGV2ZW50X2lkeC5jb2RlWzA6MF0gPSByZXN1
bHRfaWQNCj4+PiArICAgICovDQo+Pj4gKw0KPj4+ICsgICAvKiBTQklfUE1VX0hXX0NQVV9DWUNM
RVM6IDB4MDEgOiB0eXBlKDB4MDApICovDQo+Pj4gKyAgIGZkdF9ldmVudF9jdHJfbWFwWzBdID0g
Y3B1X3RvX2JlMzIoMHgwMDAwMDAwMSk7DQo+Pj4gKyAgIGZkdF9ldmVudF9jdHJfbWFwWzFdID0g
Y3B1X3RvX2JlMzIoMHgwMDAwMDAwMSk7DQo+Pj4gKyAgIGZkdF9ldmVudF9jdHJfbWFwWzJdID0g
Y3B1X3RvX2JlMzIoY21hc2sgfCAxIDw8IDApOw0KPj4+ICsNCj4+PiArICAgLyogU0JJX1BNVV9I
V19JTlNUUlVDVElPTlM6IDB4MDIgOiB0eXBlKDB4MDApICovDQo+Pj4gKyAgIGZkdF9ldmVudF9j
dHJfbWFwWzNdID0gY3B1X3RvX2JlMzIoMHgwMDAwMDAwMik7DQo+Pj4gKyAgIGZkdF9ldmVudF9j
dHJfbWFwWzRdID0gY3B1X3RvX2JlMzIoMHgwMDAwMDAwMik7DQo+Pj4gKyAgIGZkdF9ldmVudF9j
dHJfbWFwWzVdID0gY3B1X3RvX2JlMzIoY21hc2sgfCAxIDw8IDIpOw0KPj4+ICsNCj4+PiArICAg
LyogU0JJX1BNVV9IV19DQUNIRV9EVExCIDogMHgwMyBSRUFEIDogMHgwMCBNSVNTIDogMHgwMCB0
eXBlKDB4MDEpICovDQo+Pj4gKyAgIGZkdF9ldmVudF9jdHJfbWFwWzZdID0gY3B1X3RvX2JlMzIo
MHgwMDAxMDAxOSk7DQo+Pj4gKyAgIGZkdF9ldmVudF9jdHJfbWFwWzddID0gY3B1X3RvX2JlMzIo
MHgwMDAxMDAxOSk7DQo+Pj4gKyAgIGZkdF9ldmVudF9jdHJfbWFwWzhdID0gY3B1X3RvX2JlMzIo
Y21hc2spOw0KPj4+ICsNCj4+PiArICAgLyogU0JJX1BNVV9IV19DQUNIRV9EVExCIDogMHgwMyBX
UklURSA6IDB4MDEgTUlTUyA6IDB4MDAgdHlwZSgweDAxKSAqLw0KPj4+ICsgICBmZHRfZXZlbnRf
Y3RyX21hcFs5XSA9IGNwdV90b19iZTMyKDB4MDAwMTAwMUIpOw0KPj4+ICsgICBmZHRfZXZlbnRf
Y3RyX21hcFsxMF0gPSBjcHVfdG9fYmUzMigweDAwMDEwMDFCKTsNCj4+PiArICAgZmR0X2V2ZW50
X2N0cl9tYXBbMTFdID0gY3B1X3RvX2JlMzIoY21hc2spOw0KPj4+ICsNCj4+PiArICAgLyogU0JJ
X1BNVV9IV19DQUNIRV9JVExCIDogMHgwNCBSRUFEIDogMHgwMCBNSVNTIDogMHgwMCB0eXBlKDB4
MDEpICovDQo+Pj4gKyAgIGZkdF9ldmVudF9jdHJfbWFwWzEyXSA9IGNwdV90b19iZTMyKDB4MDAw
MTAwMjEpOw0KPj4+ICsgICBmZHRfZXZlbnRfY3RyX21hcFsxM10gPSBjcHVfdG9fYmUzMigweDAw
MDEwMDIxKTsNCj4+PiArICAgZmR0X2V2ZW50X2N0cl9tYXBbMTRdID0gY3B1X3RvX2JlMzIoY21h
c2spOw0KPj4+ICsNCj4+PiArICAgLyogVGhpcyBhIE9wZW5TQkkgc3BlY2lmaWMgRFQgcHJvcGVy
dHkgZG9jdW1lbnRlZCBpbiBPcGVuU0JJIGRvY3MgKi8NCj4+PiArICAgcWVtdV9mZHRfc2V0cHJv
cChmZHQsIHBtdV9uYW1lLCAicmlzY3YsZXZlbnQtdG8tbWhwbWNvdW50ZXJzIiwNCj4+PiArICAg
ICAgICAgICAgICAgICAgICBmZHRfZXZlbnRfY3RyX21hcCwgc2l6ZW9mKGZkdF9ldmVudF9jdHJf
bWFwKSk7DQo+Pj4gK30NCj4+PiArDQo+Pj4gIHN0YXRpYyBib29sIHJpc2N2X3BtdV9jb3VudGVy
X3ZhbGlkKFJJU0NWQ1BVICpjcHUsIHVpbnQzMl90IGN0cl9pZHgpDQo+Pj4gIHsNCj4+PiAgICAg
IGlmIChjdHJfaWR4IDwgMyB8fCBjdHJfaWR4ID49IFJWX01BWF9NSFBNQ09VTlRFUlMgfHwNCj4+
PiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L3BtdS5oIGIvdGFyZ2V0L3Jpc2N2L3BtdS5oDQo+
Pj4gaW5kZXggMDM2NjUzNjI3Zjc4Li4zMDA0Y2UzN2I2MzYgMTAwNjQ0DQo+Pj4gLS0tIGEvdGFy
Z2V0L3Jpc2N2L3BtdS5oDQo+Pj4gKysrIGIvdGFyZ2V0L3Jpc2N2L3BtdS5oDQo+Pj4gQEAgLTMx
LDUgKzMxLDYgQEAgaW50IHJpc2N2X3BtdV9pbml0KFJJU0NWQ1BVICpjcHUsIGludCBudW1fY291
bnRlcnMpOw0KPj4+ICBpbnQgcmlzY3ZfcG11X3VwZGF0ZV9ldmVudF9tYXAoQ1BVUklTQ1ZTdGF0
ZSAqZW52LCB1aW50NjRfdCB2YWx1ZSwNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVpbnQzMl90IGN0cl9pZHgpOw0KPj4+ICBpbnQgcmlzY3ZfcG11X2luY3JfY3RyKFJJU0NW
Q1BVICpjcHUsIGVudW0gcmlzY3ZfcG11X2V2ZW50X2lkeCBldmVudF9pZHgpOw0KPj4+ICt2b2lk
IHJpc2N2X3BtdV9nZW5lcmF0ZV9mZHRfbm9kZSh2b2lkICpmZHQsIGludCBudW1fY291bnRlcnMs
IGNoYXIgKnBtdV9uYW1lKTsNCj4+PiAgaW50IHJpc2N2X3BtdV9zZXR1cF90aW1lcihDUFVSSVND
VlN0YXRlICplbnYsIHVpbnQ2NF90IHZhbHVlLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVpbnQzMl90IGN0cl9pZHgpOw0KPj4+IC0tDQo+Pj4gMi4yNS4xDQo+Pj4NCj4+Pg0KPj4+
DQo+IA0K

